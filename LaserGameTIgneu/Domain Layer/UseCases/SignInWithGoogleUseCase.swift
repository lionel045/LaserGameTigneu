//
//  SignInWithGoogleUseCase.swift
//  LaserGame
//
//  Created by Lion on 31/08/2024.
//

import Foundation
import GoogleSignIn

class SignInWithGoogleUseCase : SignInWithGoogleUseCaseInterface {
    private let repository: AuthRepositoryInterface

    init(repository: AuthRepositoryInterface) {
        self.repository = repository
    }

    func execute(user: GIDGoogleUser) async throws -> DomainUser? {
        return try await repository.signInWithGoogle(user: user)
    }
    
    func signOut() async throws {
        return try await repository.signOut()
    }
}
