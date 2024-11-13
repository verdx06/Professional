//
//  OnboardingView.swift
//  Prof
//
//  Created by Виталий Багаутдинов on 20.10.2024.
//

import SwiftUI

struct OnboardingView: View {
    
    @StateObject var vm = ViewModel()
    @State var isNavigateUp = false
    @State var isNavigateIn = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Omboarding(image: vm.items[vm.currentIndex].image, text1:
                            vm.items[vm.currentIndex].text1, text2: vm.items[vm.currentIndex].text2)
                
                Spacer()
                
                HStack {
                    if vm.currentIndex != 2 {
                        SkipNext
                    }
                    else {
                        End
                    }
                    
                } .padding()
                    .onAppear {
                        // Когда представление появляется, мы можем загрузить сохраненные indices (если необходимо)
                        vm.currentIndex = UserDefaults.standard.integer(forKey: "currentIndex")
                    }
                
                
                Spacer()
            }
        }
    }
}

#Preview {
    OnboardingView()
}
