//
//  AuthRepositoryImpl.swift
//  LaserGame
//
//  Created by Lion on 02/09/2024.
//

import Foundation
import GoogleSignIn
import FirebaseAuth


struct AuthRepositoryImpl: AuthRepositoryInterface {

     let googleSignInService: GoogleSignInServiceProtocol
     let anonymousAuthService: AnonymousAuthServiceProtocol
    
    func signInAnonymously() async throws -> DomainUser {
        guard let result = try await anonymousAuthService.signInAnonymously() else {
            throw NSError(domain: "SignInError", code: -1, userInfo: nil)
        }
        return DomainUser.fromFirebaseUser(result.user)!
    }

    func signInWithGoogle(user: GIDGoogleUser) async throws -> DomainUser? {
        guard let idToken = user.idToken?.tokenString else { return nil }
        let credentials = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
        let authDataResult = try await authenticateUser(credentials: credentials)
        return authDataResult.map { DomainUser.fromFirebaseUser($0.user)! }
    }

    private func authenticateUser(credentials: AuthCredential) async throws -> AuthDataResult? {
        if let currentUser = Auth.auth().currentUser {
            return try await currentUser.link(with: credentials)
        } else {
            return try await Auth.auth().signIn(with: credentials)
        }
    }

    func signOut() async throws {
        try await anonymousAuthService.signOut()
        googleSignInService.signOutFromGoogle()
    }
}
