//
//  verifyOTPView.swift
//  Prof
//
//  Created by Виталий Багаутдинов on 04.11.2024.
//

import SwiftUI

struct verifyOTPView: View {
    
    @State var code: [String] = Array(repeating: "", count: 6)
    let email: String
    
    @State var isNavigate: Bool = false
    
    var body: some View {
        VStack {
            HStack{
                ForEach(code.indices, id: \.self) { index in
                    TextField("", text: $code[index])
                        .keyboardType(.numberPad)
                        .frame(width: 10, height: 62)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 0).stroke(style: StrokeStyle()))
                }
            }
            
            Button {
                send()
            } label: {
                Text("lol")
            }
            
            NavigationLink(
                isActive: $isNavigate) {
                    NewPassword()
                } label: {
                    EmptyView()
                }


            
        }
    }
    
    func send() {
        Task {
            do {
                try await SupabaseModel.instance.verifyOTP(email: email, token: code.joined())
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
    verifyOTPView(email: "berkut589243@gmail.com")
}
