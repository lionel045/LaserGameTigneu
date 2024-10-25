//
//  LaserGameTIgneuApp.swift
//  LaserGameTIgneu
//
//  Created by Lion on 09/07/2024.
//
import SwiftUI
import Firebase
import GoogleSignIn

@main
struct LaserGameTIgneuApp: App {
    private let appDIContainer = AppFormulaDIContainer()
    private let appAuthDIContainer = AppAuthDIContainer()

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LaunchPage()
                .environmentObject(appAuthDIContainer.authViewModel)
                .environmentObject(appDIContainer.formulaViewModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}
