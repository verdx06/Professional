//
//  ForgotPassword.swift
//  Prof
//
//  Created by Виталий Багаутдинов on 03.11.2024.
//

import SwiftUI

struct ForgotPassword: View {
    
    @State var email: String = "berkut589243@gmail.com"
    @State var isNavigate: Bool = false
    
    var body: some View {
        VStack {
            CustomTextField(title: "Email Address", text: $email, example: "")
            CustomButton(text: "Send", fill: true) {
                send()
            }
            
            NavigationLink(
                isActive: $isNavigate) {
                    verifyOTPView(email: email)
                } label: {
                    EmptyView()
                }
        }
    }
    func send() {
        Task {
            do {
                try await SupabaseModel.instance.resetPasword(email: email)
                await MainActor.run {
                    self.isNavigate = true
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    ForgotPassword()
}
