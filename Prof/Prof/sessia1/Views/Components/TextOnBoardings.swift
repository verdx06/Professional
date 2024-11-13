//
//  TextOnBoardings.swift
//  Prof
//
//  Created by Виталий Багаутдинов on 17.10.2024.
//

import SwiftUI

struct TextOnBoardings: View {

    let text: String
    let colored: Bool
    
    var body: some View {
            Text(text)
            .foregroundColor(colored ? .blueColorButton : .black)
            .font(colored ? .title : .title3)
            .fontWeight(colored ? .bold : .none)
                .padding(.horizontal)
                .multilineTextAlignment(.center)
    }
    
}
