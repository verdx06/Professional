//
//  TextFIeldOnBoardings.swift
//  Prof
//
//  Created by Виталий Багаутдинов on 17.10.2024.
//

import SwiftUI

struct TextFIeldOnBoardings: View {
    
    let text: String
    let colored: Bool
    
    var body: some View {
            Text(text)
            .foregroundColor(colored ? .blueColorButton : .black)
                .fontWeight(.bold)
                .padding(.horizontal)
                .multilineTextAlignment(.center)
    }
}
