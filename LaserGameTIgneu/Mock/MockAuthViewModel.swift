//import FirebaseAuth
//import GoogleSignIn
//
//
//
//
//class MockAuthViewModel: AuthViewModel {
//    init() {
//        super.init(
//            signInAnonymouslyUseCase: MockSignInAnonymouslyUseCase(),
//            signInWithGoogleUseCase: MockSignInWithGoogleUseCase()
//        )
//        
//        // Simulate a logged-in state with a mock user
//        let mockUser = MockUser(uid: "mock-uid", displayName: "Mock User")
//        self.user = mockUser // Change the `user` property type in `AuthViewModel` to accept `MockUser`.
//        self.authState = .signedIn
//    }
//}
