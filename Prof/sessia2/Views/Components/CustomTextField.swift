//
//  CustomTextField.swift
//  Prof
//
//  Created by Виталий Багаутдинов on 30.10.2024.
//

import SwiftUI

struct CustomTextField: View {
    
    let title: String
    @Binding var text: String
    let example: String
    let secretField: Bool?
    
    init(title: String, text: Binding<String>, example: String, secretField: Bool = false) {
        self.title = title
        self._text = text
        self.example = example
        self.secretField = secretField
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .foregroundColor(.A_7_A_7_A_7)
            ZStack {
                if secretField ?? false {
                    SecureField("", text: $text)
                        .padding()
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 5).stroke(style: StrokeStyle()).foregroundColor(.A_7_A_7_A_7))
                        .autocorrectionDisabled()
                    
                }
                else {
                    TextField("", text: $text)
                        .padding()
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 5).stroke(style: StrokeStyle()).foregroundColor(.A_7_A_7_A_7))
                }
                if text.count == 0 {
                    HStack {
                        Text(example)
                            .foregroundColor(.CFCFCF)
                        Spacer()
                    }.padding()
                }
            }
        }.padding(.horizontal)
    }
}

#Preview {
    CustomTextField(title: "Full number", text: .constant(""), example: "+7-999-999-99-99", secretField: false)
}
