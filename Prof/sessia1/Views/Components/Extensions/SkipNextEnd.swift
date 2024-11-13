//
//  SkipNext.swift
//  Prof
//
//  Created by Виталий Багаутдинов on 30.10.2024.
//

import Foundation
import SwiftUI

extension OnboardingView {
    
     var SkipNext: some View {
        HStack {
            CustomButton(final: false, text: "Skip", fill: false) {
                withAnimation {
                    vm.currentIndex = vm.items.count - 1
                }
            }
            
            Spacer()
            
            CustomButton(final: false, text: "Next", fill: true) {
                withAnimation {
                    // Увеличиваем индекс, если он в пределах массива
                    if vm.currentIndex + 1 < vm.items.count {
                        vm.currentIndex += 1
                        UserDefaults.standard.set(true, forKey: "\(vm.currentIndex)")
                    }
                }
            }
        }
        .animation(.easeInOut, value: vm.currentIndex)
        
    }
    
    var End: some View {
        VStack {
            CustomButton(final: true, text: "Sign Up", fill: true) {
                self.isNavigateUp = true
            }
            .padding()
            HStack {
                Text("Already have an account?")
                Button {
                    self.isNavigateIn = true
                } label: {
                    Text("Sign in")
                }

            }
            
            Button {
                vm.currentIndex = 0
                UserDefaults.standard.set(true, forKey: "\(vm.currentIndex)")
            } label: {
                Text("rem")
            }

            
            NavigationLink(
                destination: SignIn(),
                isActive: $isNavigateIn,
                label: {
                    EmptyView()
                })
            
            NavigationLink(
                destination: SignUp(),
                isActive: $isNavigateUp,
                label: {
                    EmptyView()
                })
        }
    }
    
    
}
