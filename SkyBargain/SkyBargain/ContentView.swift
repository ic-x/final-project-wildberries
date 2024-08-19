//
//  ContentView.swift
//  SkyBargain
//

import SwiftUI

struct ContentView: View {
    @AppStorage("hasSeenWelcomeScreen") var hasSeenWelcomeScreen: Bool = false

    init(flightsFindService: FlightsFindService, saveFlightsService: SaveFlightsService) {
        self._viewModel = StateObject(wrappedValue: .init(flightsFindService: flightsFindService, saveFlightsService: saveFlightsService))
    }
    
    var body: some View {
        switch hasSeenWelcomeScreen {
        case false:
            WelcomeView()
        default:
            MainView(viewModel: viewModel)
        }
    }
    
    @StateObject private var viewModel: FlightsListViewModel
}

#Preview {
    ContentView(flightsFindService: FlightsFindService(), saveFlightsService: SaveFlightsService())
}
