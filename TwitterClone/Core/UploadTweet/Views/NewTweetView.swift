//
//  NewTweetView.swift
//  TwitterClone
//
//  Created by Takahiro Tominaga on 2022/03/12.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {

    @State private var caption = ""
    // 全画面表示をコントロールするもの
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = UploadTweetViewModel()

    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }

                Spacer()

                Button {
                    viewModel.uploadTweet(withCaption: caption)
                } label: {
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .padding()

            HStack(alignment: .top) {
                if let user = authViewModel.currentUser {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)
                }

                TextArea("What's happening?", text: $caption)
            }
            .padding()
        }
        // Publisher から検出してこっちから実行できる！
        .onReceive(viewModel.$didUploadTweet) { success in
            if success {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
