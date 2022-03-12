//
//  ProfilePhotoSelectorView.swift
//  TwitterClone
//
//  Created by Takahiro Tominaga on 2022/03/12.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?  // UIKit
    @State private var profileImage: Image?     // SwiftUI
    
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Setup account",
                           title2: "Add a profile photo")
            
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .modifier(ProfileImageModifier())
                } else {
                    Image("plus_photo")
                        .resizable()
                        .modifier(ProfileImageModifier())
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            .padding(.top, 44)
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        // convert uikit image to swiftui image
        profileImage = Image(uiImage: selectedImage)
    }
}

// custom modifier
private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
    //                    .renderingMode(.template)
            .scaledToFit()
            .frame(width: 180, height: 180)
            .clipShape(Circle())
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
