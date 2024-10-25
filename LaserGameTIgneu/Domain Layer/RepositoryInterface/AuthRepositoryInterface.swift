import Foundation
import FirebaseAuth
import GoogleSignIn

protocol AuthRepositoryInterface {
    func signInAnonymously() async throws -> DomainUser
    func signInWithGoogle(user: GIDGoogleUser) async throws -> DomainUser?
    func signOut() async throws
}

