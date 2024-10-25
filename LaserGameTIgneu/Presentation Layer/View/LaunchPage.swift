import SwiftUI
import FirebaseAuth
import GoogleSignIn
struct LaunchPage: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var formulaViewModel: FormulaViewModel
    @State private var showUserPage = false
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea(.all)
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            if authViewModel.authState == .signedIn {
             
                Userpage()
            }
            else {
                VStack {
                    Spacer()
                    HStack {
                        Button {
                            Task {
                                await authViewModel.signInWithGoogle()
                                if authViewModel.authState == .signedIn {
                                    showUserPage = true
                                }
                            }
                        } label: {
                            Image("GoogleLogo")
                            Text("Sign in with Google")
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .foregroundColor(.black.opacity(0.7))
                    .tint(.white)
                    .padding()
                    
                    Button("Skip") {
                        Task {
                            await authViewModel.signInAnonymously()
                        }
                    }
                    .toolbar(.hidden, for: .automatic)
                    .foregroundColor(.gray.opacity(0.90))
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 50)
                }
                .ignoresSafeArea(.all)
               
            }
            
        }

    }
}

#Preview {
    let authViewModelData = AppAuthDIContainer.authViewModelData()
    let realMockFormulaViewmodel = AppFormulaDIContainer().formulaViewModel
       return LaunchPage()
           .environmentObject(authViewModelData)    
           .environmentObject(realMockFormulaViewmodel)
}
