//
//  MainView.swift
//  SkyBargain
//

import SwiftUI
import UI

struct MainView: View {
    @State private var selectedTab: Int = 0
    @EnvironmentObject var flightsFindService: FlightsFindService
    @EnvironmentObject var saveFlightsService: SaveFlightsService
    
    var body: some View {
        ZStack {
            Color.brandBackground
                .ignoresSafeArea()
            
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
}

//#Preview {
//    MainView()
//}
