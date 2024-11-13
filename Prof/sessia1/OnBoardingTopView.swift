//
//  OnBoardingTopView.swift
//  Prof
//
//  Created by Виталий Багаутдинов on 17.10.2024.
//

import SwiftUI

enum Images {
    case image1, image2, image3
}

struct OnBoardingTopView: View {
    var body: some View {
        GeometryReader { geo in
            sw
            Omboarding(geo: geo, image: <#String#>)
            
        }
    }
}

#Preview {
    OnBoardingTopView()
}
