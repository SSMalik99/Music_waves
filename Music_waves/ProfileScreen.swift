//
//  ProfileScreen.swift
//  Music_waves
//
//  Created by Saravjeet Singh on 2023-04-04.
//


import SwiftUI
import PhotosUI

struct ProfileScreen: View {
    @EnvironmentObject var vm: UserStateViewModel
    var userDetail = UserStateViewModel.getUserDetail()
    
    
    @State private var image : Image?
    @State private var inputImage : UIImage?
    @State private var showingImagePicker = false
   
    
    var body: some View {
        
        VStack{
            Spacer()
            
            Button{
                print("clicking")
                showingImagePicker = true
                
            }label: {
                
                if image != nil {
                    image?
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                        .cornerRadius(300 / 2)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 4)
                                .frame(width: 300, height: 300)
                        )
                        .shadow(radius: 10)
                }else {
                    Image(systemName: "figure.walk.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                        .cornerRadius(300 / 2)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 4)
                                .frame(width: 300, height: 300)
                        )
                        .shadow(radius: 10)
                }
                
                    
    //              .resizable()
    //              .frame(width: 40, height: 40)
    //              .foregroundColor(.green)
            }.foregroundColor(.white)
                .onChange(of: inputImage) { _ in loadImage() }
                .sheet(isPresented: $showingImagePicker) {
                    ImagePicker(image: $inputImage)
                }
            Spacer()
            
            VStack{
                Text("Email : ")
                Text("\(userDetail["email"]!)")
            }
            
            Spacer()
            
            
            VStack{
                
                Text("Joined Date : ")
                
                Text("\(userDetail["userCreationTime"] ?? "N/A")")
            }
            Spacer()
            
        }.background(
            Color("LightMainColor")
        )
        
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        guard let data = inputImage.jpegData(compressionQuality: 0.5) else { return }
        let encoded = try! PropertyListEncoder().encode(data)
        UserDefaults.standard.set(encoded, forKey: "userProfileImage")
        print(data)
//        UserDefaults.standard.set(image, forKey: "userProfileImage")
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}



struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)

            guard let provider = results.first?.itemProvider else { return }

            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    self.parent.image = image as? UIImage
                }
            }
        }
    }
}
