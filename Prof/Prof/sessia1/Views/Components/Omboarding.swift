//
//  Omboarding.swift
//  Prof
//
//  Created by Виталий Багаутдинов on 17.10.2024.
//

import SwiftUI

struct Omboarding: View {
    
    let image: String
    let text1: String
    let text2: String
        
    @State var currentIndex: Int = 0
    
    var body: some View {
        VStack {
            
            Spacer()
            
            VStack {
                Image(image)
                
                TextOnBoardings(text: text1, colored: true)
                    .padding()
                
                TextOnBoardings(text: text2, colored: false)
                
            }.animation(.easeInOut, value: currentIndex)
            

            
        }.padding()
        
    }
}

#Preview {
    Omboarding(image: "image1", text1: "Lol", text2: "Enjoy quick pick-up and delivery to your destination")
}
