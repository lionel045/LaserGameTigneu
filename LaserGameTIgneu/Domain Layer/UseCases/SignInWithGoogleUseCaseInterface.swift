//
//  SignInWithGoogleUseCaseInterface.swift
//  LaserGame
//
//  Created by Lion on 01/09/2024.
//

import Foundation
import FirebaseAuth
import GoogleSignIn

protocol SignInWithGoogleUseCaseInterface {
    
    func execute(user: GIDGoogleUser) async throws -> DomainUser?
    
    func signOut() async throws
}
