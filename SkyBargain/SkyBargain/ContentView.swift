//
//  ContentView.swift
//  SkyBargain
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("hasSeenWelcomeScreen") var hasSeenWelcomeScreen: Bool = false
    @StateObject private var flightsListViewModel: FlightsListViewModel
    @StateObject private var favoriteFlightsListViewModel: FavoriteFlightsListViewModel

    init(flightsFindService: FlightsFindService, saveFlightsService: SaveFlightsService) {
        self._flightsListViewModel = StateObject(wrappedValue: .init(flightsFindService: flightsFindService, saveFlightsService: saveFlightsService))
        self._favoriteFlightsListViewModel = StateObject(wrappedValue: .init(flightsFindService: flightsFindService, saveFlightsService: saveFlightsService))
    }
    
    var body: some View {
        switch hasSeenWelcomeScreen {
        case false:
            WelcomeView()
        default:
            MainView(flightsListViewModel: flightsListViewModel, favoriteFlightsListViewModel: favoriteFlightsListViewModel)
        }
    }
}

#Preview {
    ContentView(flightsFindService: FlightsFindService(), saveFlightsService: SaveFlightsService())
}
