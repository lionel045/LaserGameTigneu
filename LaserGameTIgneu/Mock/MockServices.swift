import Foundation
import FirebaseAuth
import GoogleSignIn

// Mock de DomainUser pour simuler les utilisateurs
struct MockDomainUser {
    static let mockUser = DomainUser(
        id: "mock-uid",
        displayName: "Mock User",
        email: "mockuser@example.com",
        provider: "mockProvider"
    )
}

// Mock du Use Case de connexion Google
class MockSignInWithGoogleUseCase: SignInWithGoogleUseCaseInterface {
    func execute(user: GIDGoogleUser) async throws -> DomainUser? {
        try await Task.sleep(nanoseconds: 500_000_000)
        
        // Retourne un utilisateur fictif basé sur le user Google mocké
        return MockDomainUser.mockUser
    }
    
    func signOut() async throws {
        print("Mock: Signed out from Google")
    }
}

class MockSignInAnonymouslyUseCase: SignInAnonymouslyUseCaseInterface {
    func execute() async throws -> DomainUser? {
        // Simule un délai pour imiter une opération réseau
        try await Task.sleep(nanoseconds: 500_000_000)
        
        // Retourne un utilisateur fictif anonyme
        return MockDomainUser.mockUser
    }
    
    func signOut() async throws {
        print("Mock: Signed out anonymously")
    }
}

// Mock du ViewModel pour les tests
class MockAuthViewModel: AuthViewModel {
    
    init() {
        super.init(
            signInAnonymouslyUseCase: MockSignInAnonymouslyUseCase(),
            signInWithGoogleUseCase: MockSignInWithGoogleUseCase()
        )
        
        // Simuler un utilisateur connecté
        self.user = MockDomainUser.mockUser
        self.authState = .signedIn
    }
}
