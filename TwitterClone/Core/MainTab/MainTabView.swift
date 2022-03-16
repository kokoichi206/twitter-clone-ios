//
//  MainTabView.swift
//  TwitterClone
//
//  Created by Takahiro Tominaga on 2022/03/12.
//

import SwiftUI

struct MainTabView: View {

    @State private var selectedIndex = 0

    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView()
                .onTapGesture {
                    self.selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                        .accessibilityIdentifier("feed_view_link")
                    //                        .accessibilityIdentifier(TestTags.feedViewLink)
                }.tag(0)

            ExploreView()
                .onTapGesture {
                    self.selectedIndex = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
                .accessibilityIdentifier("explor_view")

            NotificationsView()
                .onTapGesture {
                    self.selectedIndex = 2
                }
                .tabItem {
                    Image(systemName: "bell")
                }.tag(2)

            MessagesView()
                .onTapGesture {
                    self.selectedIndex = 3
                }
                .tabItem {
                    Image(systemName: "envelope")
                }.tag(3)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
