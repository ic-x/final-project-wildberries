//
//  UIModuleCustomTabView.swift
//  SkyBargain
//

import SwiftUI
import UI

struct UIModuleCustomTabView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        CustomTabView(
            selection: $selectedTab,
            tabItems: [
                CustomTabItem(
                    icon: Image(systemName: "list.bullet.circle"),
                    activeIcon: Image(systemName: "list.bullet.circle.fill"),
                    view: AnyView(HomeView())
                ),
                CustomTabItem(
                    icon: Image(systemName: "star.circle"),
                    activeIcon: Image(systemName: "star.circle.fill"),
                    view: AnyView(FavoritesView())
                ),
                CustomTabItem(
                    icon: Image(systemName: "person.crop.circle"),
                    activeIcon: Image(systemName: "person.crop.circle.fill"),
                    view: AnyView(ProfileView())
                )
            ]
        )
    }
}

struct HomeView: View {
    var body: some View {
        Text("Home View")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
    }
}

struct FavoritesView: View {
    var body: some View {
        Text("Favorites View")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.green)
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile View")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue)
    }
}
