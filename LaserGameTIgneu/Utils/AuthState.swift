//
//  AuthState.swift
//  LaserGame
//
//  Created by Lion on 01/09/2024.
//

import Foundation
enum AuthState {
    case authenticated // Anonymously authenticated in Firebase.
    case signedIn // Authenticated in Firebase using one of service providers, and not anonymous.
    case signedOut // Not authenticated in Firebase.
}
