////
////  Main.swift
////  Prof
////
////  Created by Виталий Багаутдинов on 30.10.2024.
////
//
//import SwiftUI
//import PhotosUI
//
//struct AvatarImage: Transferable, Equatable {
//  let image: Image
//  let data: Data
//
//  static var transferRepresentation: some TransferRepresentation {
//    DataRepresentation(importedContentType: .image) { data in
//      guard let image = AvatarImage(data: data) else {
//        throw TransferError.importFailed
//      }
//
//      return image
//    }
//  }
//}
//
//extension AvatarImage {
//  init?(data: Data) {
//    guard let uiImage = UIImage(data: data) else {
//      return nil
//    }
//
//    let image = Image(uiImage: uiImage)
//    self.init(image: image, data: data)
//  }
//}
//
//enum TransferError: Error {
//  case importFailed
//}
//
//struct Main: View {
//    
//    @State var imageSelection: PhotosPickerItem?
//    @State var avatarImage: AvatarImage?
//    
//    var body: some View {
//        NavigationStack {
//            Form {
//                Section {
//                    HStack {
//                        Group {
//                            if let avatarImage {
//                                avatarImage.image.resizable()
//                            } else {
//                                Color.clear
//                            }
//                        }
//                        .scaledToFit()
//                        .frame(width: 80, height: 80)
//                        
//                        Spacer()
//                        
//                        PhotosPicker(selection: $imageSelection, matching: .images) {
//                            Image(systemName: "pencil.circle.fill")
//                                .symbolRenderingMode(.multicolor)
//                                .font(.system(size: 30))
//                                .foregroundColor(.accentColor)
//                        }
//                        .onChange(of: imageSelection) { newValue in
//                            loadTransferable(from: newValue)
//                        }
//                    }
//                }
//                Button {
//                    print("Пытаюсь")
//                    update() // Вызов функции обновления
//                } label: {
//                    Text("update")
//                        .frame(width: 50)
//                }
//            }
//        }
//    }
//    
//    private func loadTransferable(from imageSelection: PhotosPickerItem?) {
//        guard let imageSelection else { return }
//        Task {
//          do {
//            avatarImage = try await imageSelection.loadTransferable(type: AvatarImage.self)
//              
//          } catch {
//            debugPrint("Error loading transferable: \(error)")
//          }
//        }
//    }
//    
//    func update() {
//        Task {
//            do {
//                guard let data = avatarImage?.data else { return }
//                // Используйте значение, возвращаемое функцией
//                let result = try await SupabaseModel.instance.uploadImage(data: data)
//                print("Image uploaded successfully: \(result)") // Предполагаем, что result возвращает успех
//            } catch {
//                print("Error uploading image: \(error.localizedDescription)")
//            }
//        }
//    }
//}
//
//
//#Preview {
//    Main()
//}
