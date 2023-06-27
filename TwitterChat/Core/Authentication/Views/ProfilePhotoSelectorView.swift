//
//  ProfilePhotoSelectorView.swift
//  TwitterChat
//
//  Created by Nick Pavlov on 6/26/23.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @EnvironmentObject var vm: AuthViewModel
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Setup account", title2: "Add a profile photo")
            
            Button {
                showImagePicker.toggle()
            } label: {
                VStack {
                    if let profileImage = profileImage {
                        profileImage
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 200, height: 200)
                            .padding(.top, 100)
                    } else {
                        Image("addPhoto")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                            .padding(.top, 100)
                    }
                    
                    if let selectedImage = selectedImage {
                        Button {
                            vm.uploadProfileImage(selectedImage)
                        } label: {
                            Text("Continue")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 340, height: 50)
                                .background(.blue)
                                .clipShape(Capsule())
                                .padding()
                        }
                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                    }
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(image: $selectedImage)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
            .environmentObject(AuthViewModel())
    }
}

