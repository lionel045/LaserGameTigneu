//
//  SignInAnonymouslyUseCase.swift
//  LaserGame
//
//  Created by Lion on 31/08/2024.
//

import Foundation
import FirebaseAuth

import Foundation

class SignInAnonymouslyUseCase : SignInAnonymouslyUseCaseInterface {
    private let repository: AuthRepositoryInterface

    init(repository: AuthRepositoryInterface) {
        self.repository = repository
    }

    func execute() async throws -> DomainUser? {
        return try await repository.signInAnonymously()
    }
    
    func signOut() async throws {
        return try await repository.signOut()
    }
}
