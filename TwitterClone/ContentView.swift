//
//  ContentView.swift
//  TwitterClone
//
//  Created by Takahiro Tominaga on 2022/03/12.
//

import SwiftUI
import Kingfisher

struct ContentView: View {

    @State private var showMenu = false
    // Share arround the project!!, but initialize somewhere
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        Group {
            // No user Logged IN
            if viewModel.userSession == nil {
                LoginView()
            } else {
                // have a looged in user
                mainInterfaceView
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {

    var mainInterfaceView: some View {
        ZStack(alignment: .topLeading) {

            MainTabView()
                .navigationBarHidden(showMenu)

            if showMenu {
                ZStack {
                    Color(.black).opacity(showMenu ? 0.25 : 0.0)
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }

            // After goes on Top
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0 : -300, y: 0)
                .background(showMenu ? Color.white : Color.clear)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if let user = viewModel.currentUser {
                    Button {
                        withAnimation(.easeInOut) {
                            showMenu.toggle()
                        }
                    } label: {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 32, height: 32)
                            .clipShape(Circle())
                    }
                }
            }
        }
        .onAppear {
            // 元ページに戻った時にサイドメニューを閉じる
            showMenu = false
        }
    }
}
