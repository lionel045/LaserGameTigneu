//
//  SignInAnonymouslyUseCaseInterface.swift
//  LaserGame
//
//  Created by Lion on 01/09/2024.
//

import Foundation
import FirebaseAuth

protocol SignInAnonymouslyUseCaseInterface {
    func execute() async throws -> DomainUser?
    func signOut() async throws
}
