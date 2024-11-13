//
//  ContentView.swift
//  Prof
//
//  Created by Виталий Багаутдинов on 17.10.2024.
//

import SwiftUI

struct ContentView: View {
    // Модель для хранения изображения и текста
    struct Item {
        let image: String
        let text: String
    }
    
    // Пример очереди изображений и текстов
    let items: [Item] = [
        Item(image: "image1", text: "Текст 1"),
        Item(image: "image2", text: "Текст 2"),
        Item(image: "image3", text: "Текст 3")
    ]
    
    @State private var currentIndex: Int = 0
    
    var body: some View {
        VStack {
            if currentIndex < items.count {
                // Анимация появления изображения и текста
                VStack {
                    Image(items[currentIndex].image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .transition(.opacity)
                    
                    Text(items[currentIndex].text)
                        .font(.largeTitle)
                        .transition(.opacity)
                }
                .animation(.easeInOut, value: currentIndex) // Применение анимации при изменении индекса
            }
            
            Button(action: {
                withAnimation {
                    // Увеличиваем индекс, если он в пределах массива
                    if currentIndex + 1 < items.count {
                        currentIndex += 1
                    } else {
                        currentIndex = 0 // Сброс на первый элемент, если достигнут конец
                    }
                }
            }) {
                Text("Next")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
