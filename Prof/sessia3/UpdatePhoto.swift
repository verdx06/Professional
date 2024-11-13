//
//  UpdatePhoto.swift
//  Prof
//
//  Created by Виталий Багаутдинов on 13.11.2024.
//

import SwiftUI

struct UpdatePhoto: View {
    @State var updatemyAvatar: UIImage = UIImage(systemName: "heart") ?? UIImage()
    @State var myAvatar: Image? = nil
    @State var isPickerShow = false
       
       var body: some View {
           VStack {
               if let image = myAvatar { // Use conditional binding to check if uimage has a valu
                   Button  {
                       isPickerShow.toggle()
                   } label: {
                       image
                           .resizable() // Make the image resizable
                           .aspectRatio(contentMode: .fit) // Maintain aspect ratio
                           .frame(width: 100, height: 100) // Set frame
                   }
                   
                   Button {
                       uploadAvatar(avatar: updatemyAvatar)
                   } label: {
                       Text("update")
                   }

               } else {
                   Button  {
                       isPickerShow.toggle()
                   } label: {
                       Image(systemName: "person")
                           .resizable() // Make the image resizable
                           .aspectRatio(contentMode: .fit) // Maintain aspect ratio
                           .frame(width: 100, height: 100) // Set frame
                   }
                   
                   Button {
                       uploadAvatar(avatar: updatemyAvatar)
                   } label: {
                       Text("update")
                   }
               }
           }
           .sheet(isPresented: $isPickerShow, content: {
               ImagePicker(image: $updatemyAvatar)
               
           })
           .onAppear {
               send() // Trigger the image download when the view appears
           }
       }
    
    private func uploadAvatar(avatar: UIImage) {
        Task {
            do {
                guard let data = avatar.jpegData(compressionQuality: 1.0) else { throw URLError(.badServerResponse) }
                
                try await SupabaseModel.instance.uploadMyAvatar(data: data)
 
            } catch {
                print("UPLOAD ERROR " + error.localizedDescription)

            }
        }
    }
    
    func send() {
        Task {
            do {
                // Assuming this function returns Data
                let imageData = try await SupabaseModel.instance.downloadMyAvatar()

                // Convert Data to UIImage
                if let updatemyAvatar = UIImage(data: imageData) { // Safely unwrap optional UIImage
                    await MainActor.run {
                        myAvatar = Image(uiImage: updatemyAvatar) // Set the state variable with the new image
                    }
                } else {
                    print("Error: Could not convert data to UIImage")
                    // Handle the conversion error here (e.g., display an error image)
                }
            } catch {
                print(error.localizedDescription) // Handle any other errors
            }
        }
    }

   }


#Preview {
    UpdatePhoto()
}
