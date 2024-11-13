//
//  CustomButton.swift
//  Prof
//
//  Created by Виталий Багаутдинов on 17.10.2024.
//

import SwiftUI

struct CustomButton: View {
    let final: Bool?
    let text: String
    let fill: Bool
    
    init(final: Bool? = false, text: String, fill: Bool, action: @escaping () -> Void) {
        self.final = final
        self.text = text
        self.fill = fill
        self.action = action
    }
    
    let action: ()->()
    
    var body: some View {
        if !(final ?? false) {
            if fill {
                Button  {
                    action()
                } label: {
                    Text(text)
                        .font(Font.custom("Roboto", size: 14))
                        .fontWeight(.bold)
                        .frame(width: 70, height: 25)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blueColorButton)
                        .cornerRadius(5)
                }
            }
            else {
                Button  {
                    action()
                } label: {
                    Text(text)
                        .font(Font.custom("Roboto", size: 14))
                        .fontWeight(.bold)
                        .frame(width: 70, height: 25)
                        .padding()
                        .foregroundColor(.blueColorButton)
                        .background(RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.blueColorButton, lineWidth: 2))
                        .cornerRadius(5)
                }
            }
        }
        else {
            Button  {
                action()
            } label: {
                Text(text)
                    .font(Font.custom("Roboto", size: 16))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .frame(height: 25)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blueColorButton)
                    .cornerRadius(5)
            }
        }
    }
}

