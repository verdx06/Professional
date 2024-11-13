import SwiftUI

struct SignIn: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State var isProgress: Bool = false
    @State var isNavigate: Bool = false
    @State var error: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                CustomTextField(title: "Email Address", text: $email, example: "")
                    .padding()
                CustomTextField(title: "Password", text: $password, example: "", secretField: true)
                    .padding()
                
                CustomButtonAuth(text: "Sign In") {
                    send()
                }
                .padding()
                
                NavigationLink(destination: ForgotPassword()) {
                    Text("Forgot Password?")
                }
                .padding()
                
                NavigationLink(
                    destination: UpdatePhoto(),
                    isActive: $isNavigate,
                    label: {
                        EmptyView()
                    })
                
            }
            .navigationTitle("Sign In")
            .navigationBarBackButtonHidden()
            .alert("Неверные данныe", isPresented: $error) {
                
            }
        }
        .overlay {
            if isProgress {
                ProgressView()
            }
        }
    }
    
    func send() {
        Task {
            do {
                await MainActor.run {
                    self.isProgress = true
                    if email.isEmpty || password.isEmpty {
                        self.error = true
                        self.isProgress = false
                        return
                    }
                }
                
                try await SupabaseModel.instance.signIn(email: email, password: password)
                
                await MainActor.run {
                    self.isProgress = false
                    self.isNavigate = true
                }
                
            } catch {
                print("Error signing in: \(error)")
                await MainActor.run {
                    self.isProgress = false
                    self.error = true
                }
            }
        }
    }
}

#Preview {
    SignIn()
}
