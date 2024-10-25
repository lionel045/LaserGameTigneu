//
//  AppAuthDIContainer.swift
//  LaserGame
//
//  Created by Lion on 01/09/2024.
//

import Foundation
class AppAuthDIContainer {
    // Services
    private lazy var googleSignInService: GoogleSignInServiceProtocol = GoogleSignInService.shared
    private lazy var anonymousAuthService: AnonymousAuthServiceProtocol = AnonymousAuthService()

    // Repository
    private lazy var authRepository: AuthRepositoryInterface = AuthRepositoryImpl(
        googleSignInService: googleSignInService,
        anonymousAuthService: anonymousAuthService
    )

    // Use Cases
    private lazy var signInAnonymouslyUseCase: SignInAnonymouslyUseCase = SignInAnonymouslyUseCase(repository: authRepository)
    private lazy var signInWithGoogleUseCase: SignInWithGoogleUseCase = SignInWithGoogleUseCase(repository: authRepository)

    // ViewModels
    lazy var authViewModel: AuthViewModel = AuthViewModel(
        signInAnonymouslyUseCase: signInAnonymouslyUseCase,
        signInWithGoogleUseCase: signInWithGoogleUseCase
    )
    
    static func authViewModelData() -> AuthViewModel {
           let container = AppAuthDIContainer()
           return container.authViewModel
       }
}
