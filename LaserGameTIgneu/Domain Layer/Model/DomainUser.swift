//
//  UserMapper.swift
//  LaserGame
//
//  Created by Lion on 01/09/2024.
//

import Foundation
import FirebaseAuth
import FirebaseCore
import GoogleSignIn


struct DomainUser {
    let id: String?
    let displayName: String?
    let email: String?
    let provider: String?
    // Méthode de mappage depuis FirebaseAuth.User
    static func fromFirebaseUser(_ user: User?) -> DomainUser? {
        return DomainUser(id: user?.uid, displayName: user?.displayName, email: user?.email, provider: user?.providerData.first?.displayName)
    }
    
    // Méthode de mappage depuis GIDGoogleUser
    static func fromGoogleUser(_ googleUser: GIDGoogleUser?) -> DomainUser {
        return DomainUser(
            id: googleUser?.userID ?? "unknown",
            displayName: googleUser?.profile?.name,
            email: googleUser?.profile?.email, provider: nil

        )
    }
}
