//
//  SignOut.swift
//  Prof
//
//  Created by Виталий Багаутдинов on 30.10.2024.
//

import SwiftUI

struct SignUp: View {
    
    @State var name: String = ""
    @State var phone: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmpassword: String = ""
    
    @State var isProgress: Bool = false
    @State var isNavigate: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                CustomTextField(title: "Full name", text: $name, example: "")
                CustomTextField(title: "Phone number", text: $phone, example: "")
                CustomTextField(title: "Email Address", text: $email, example: "")
                CustomTextField(title: "Password", text: $password, example: "", secretField: true)
                CustomTextField(title: "Confirm Password", text: $confirmpassword, example: "", secretField: true)
                
                CustomButtonAuth(text: "Sign Up") {
                    send()
                }
                .padding()
                
                NavigationLink(
                    destination: SignIn(),
                    isActive: $isNavigate,
                    label: {
                        EmptyView()
                    })
                
            }.navigationBarBackButtonHidden()
        }
    }
    
    func send(){
        if password == confirmpassword {
            Task {
                do {
                    await MainActor.run {
                        self.isProgress = true
                    }
                    try await SupabaseModel.instance.singUp(email: email, name: name, password: password, phone: phone)
                    await MainActor.run {
                        self.isNavigate = true
                        self.isProgress = false
                    }
                } catch {
                    print("ERROR: " + error.localizedDescription)
                    await MainActor.run {
                        self.isProgress = false
                    }
                }
            }
        }
    }
    
}

#Preview {
    SignUp()
}
