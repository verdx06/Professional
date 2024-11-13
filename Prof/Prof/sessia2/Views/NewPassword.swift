//
//  NewPassword.swift
//  Prof
//
//  Created by Виталий Багаутдинов on 04.11.2024.
//

import SwiftUI

struct NewPassword: View {
    
    @State var password: String = ""
    @State var isNavigate: Bool = false
    @State var text: String = ""
    @State var isAlert: Bool = false
    
    var body: some View {
        VStack {
            CustomTextField(title: "Password", text: $password, example: "", secretField: true)
            
            CustomButtonAuth(text: "Reset") {
                send()
            }
            
            NavigationLink(
                isActive: $isNavigate) {
                    SignIn()
                } label: {
                    EmptyView()
                }
        }
        .alert(Text(text), isPresented: $isAlert) {
            
        }
    }
    
    func send() {
        Task {
            do {
                try await SupabaseModel.instance.updatepaswword(password: password)
                await MainActor.run {
                    self.isNavigate = true
                }
            }
            catch {
                print(error.localizedDescription)
                if error.localizedDescription == "New password should be different from the old password." {
                    self.text = "Пароль схож с прошлым"
                    self.isAlert = true
                }
                else {
                    self.text = "Ошибка, проверь соблюдены ли рекомендации"
                    self.isAlert = true
                }
            }
        }
    }
    
}

#Preview {
    NewPassword()
}
