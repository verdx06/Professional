//
//  ViewModel.swift
//  Prof
//
//  Created by Виталий Багаутдинов on 29.10.2024.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var currentIndex: Int {
        didSet {
            UserDefaults.standard.set(currentIndex, forKey: "currentIndex")
        }
    }
    
    let items: [Item] = [
        Item(image: "image1", text1: "Quick Delivery At Your Doorstep", text2: "Enjoy quick pick-up and delivery to your destination"),
        Item(image: "image2", text1: "Flexible Payment", text2: "Different modes of payment either before and after delivery without stress"),
        Item(image: "image3", text1: "Real-time Tracking", text2: "Track your packages/items from the comfort of your home till final destination")
    ]
    
    init() {
        self.currentIndex = UserDefaults.standard.integer(forKey: "currentIndex")
    }
}

