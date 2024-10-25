//
//  User page.swift
//  LaserGameTIgneu
//
//  Created by Lion on 09/07/2024.
//
import SwiftUI
import Combine
import FirebaseAuth
import GoogleSignIn

struct Userpage: View {
    @EnvironmentObject var formulaViewModel: FormulaViewModel
    @EnvironmentObject var authViewModel : AuthViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
           
                Color("BackgroundColor")
                    .ignoresSafeArea(.all)
                GeometryReader { geometry in
                    VStack(alignment: .leading) {
                        Spacer().frame(height: 25)
                        HStack {
                            Text("Bienvenue \( authViewModel.user?.displayName ?? "")")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundStyle(.white)
                                .padding(.leading, 44)
                                .padding(.bottom, 22.0)
                            Button("Deconnexion"){
                                
                                Task {
                                    await authViewModel.signOut()
                                }
                                authViewModel.authState = .signedOut
                                
                            }
                            .font(.system(size:10))
                            .padding(.leading, 70)
                            .padding(.bottom, 120)
                            
                        }
                        CoverView(width: geometry.size.width)
                            .padding(.bottom, 30)
                        
                        Text("Choisissez votre formule")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .padding(.leading, 44)
                            .padding(.bottom, 25.0)
                        
                        SegmentedControlView(formula: formulaViewModel.formulaList, width: geometry.size.width * 0.37)
                    }
                }
            
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            formulaViewModel.fetchFormulaUseCase()
        }
    }
}

#Preview("Production Preview") {
    let realFormulaViewModel = AppFormulaDIContainer().formulaViewModel
    let realAuthViewModel = AppAuthDIContainer().authViewModel
    return Userpage()
      .environmentObject(realFormulaViewModel)
      .environmentObject(realAuthViewModel)
}


