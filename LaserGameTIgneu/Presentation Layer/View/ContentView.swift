import SwiftUI
import FirebaseAuth
import FirebaseCore
import GoogleSignIn

struct ContentView: View {
    @EnvironmentObject var viewModel: FormulaViewModel
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        NavigationView {
            Userpage()
        }
        .onAppear{
            viewModel.fetchFormulaUseCase()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(MockFormulaViewModel()) // Inject MockFormulaViewModel
        .environmentObject(MockAuthViewModel()) // Inject MockAuthViewModel
}
