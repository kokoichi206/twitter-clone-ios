//
//  ProfilePhotoSelectorView.swift
//  TwitterClone
//
//  Created by Takahiro Tominaga on 2022/03/12.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Setup account",
                           title2: "Add a profile photo")
            
            Button {
                print("Pick image here..")
            } label: {
                Image("plus_photo")
                    .resizable()
//                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                    .padding(.top, 44)
            }

            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
