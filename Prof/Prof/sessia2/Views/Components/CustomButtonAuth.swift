
import SwiftUI

struct CustomButtonAuth: View {
    let text: String
    let action: ()->()
    
    var body: some View {
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

