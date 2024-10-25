//
//  AuthViewModel.swift
//  LaserGame
//
//  Created by Lion on 31/08/2024.
//

import Foundation
import FirebaseAuth
import FirebaseCore
import GoogleSignIn
class AuthViewModel: ObservableObject {
    @Published var user: DomainUser?
    private let signInAnonymouslyUseCase: SignInAnonymouslyUseCaseInterface
    private let signInWithGoogleUseCase: SignInWithGoogleUseCaseInterface
    private var authStateHandle: AuthStateDidChangeListenerHandle?
    @Published var authState: AuthState = .signedOut
    init(signInAnonymouslyUseCase: SignInAnonymouslyUseCaseInterface,
           signInWithGoogleUseCase: SignInWithGoogleUseCaseInterface) {
          self.signInAnonymouslyUseCase = signInAnonymouslyUseCase
          self.signInWithGoogleUseCase = signInWithGoogleUseCase
          observeAuthState()
      }
    private func observeAuthState() {
        authStateHandle = Auth.auth().addStateDidChangeListener { [weak self] _, firebaseUser in
            DispatchQueue.main.async {
                if let firebaseUser = firebaseUser {
                    self?.user = DomainUser.fromFirebaseUser(firebaseUser) 
                    self!.printUser(user: self?.user)
                    self?.authState = .signedIn
                } else {
                    self?.user = nil
                    self?.authState = .signedOut
                }
            }
        }
    }

    func printUser(user : DomainUser?){
        guard let user = user else {return }
        print(user)
    }
    
    func signInAnonymously() async {
        do {
            let firebaseUser = try await signInAnonymouslyUseCase.execute()
            DispatchQueue.main.async {
                self.user = firebaseUser
                self.authState = .signedIn
            }
        } catch {
            print("Failed to sign in anonymously: \(error)")
        }
    }

    func signInWithGoogle() async {
        do {
            if let googleUser = try await GoogleSignInService.shared.signInWithGoogle() {
                _ = try await signInWithGoogleUseCase.execute(user: googleUser)
                DispatchQueue.main.async {
                    self.user = DomainUser.fromGoogleUser(googleUser) 
                    self.authState = .signedIn
                }
            }
        } catch {
            print("Failed to sign in with Google: \(error)")
        }
    }



    func signOut() async {
        do {
            try await signInAnonymouslyUseCase.signOut()
            try await signInWithGoogleUseCase.signOut()
            DispatchQueue.main.async {
                self.user = nil
            }
        } catch {
            print("Failed to sign out: \(error)")
        }
    }
}

