//
//  AnonymousAuthServiceProtocol.swift
//  LaserGame
//
//  Created by Lion on 31/08/2024.
//

import Foundation
import FirebaseAuth
import FirebaseCore

protocol AnonymousAuthServiceProtocol {
    func signInAnonymously() async throws -> AuthDataResult?
    func signOut() async throws
}

class AnonymousAuthService: AnonymousAuthServiceProtocol {
    
    func signInAnonymously() async throws -> AuthDataResult? {
        do {
            let result = try await Auth.auth().signInAnonymously()
            print("FirebaseAuthSuccess: Sign in anonymously, UID: \(String(describing: result.user.uid))")
            return result
        } catch {
            print("FirebaseAuthError: failed to sign in anonymously: \(error.localizedDescription)")
            throw error
        }
    }
    
    func signOut() async throws {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                print("User signed out")
            } catch let signOutError as NSError {
                print("Error during sign out: \(signOutError)")
                throw signOutError
            }
        }
    }
}
