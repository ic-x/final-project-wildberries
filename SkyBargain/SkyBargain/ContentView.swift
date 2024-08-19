//
//  ContentView.swift
//  SkyBargain
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("hasSeenWelcomeScreen") var hasSeenWelcomeScreen: Bool = false
    @StateObject private var viewModel: FlightsListViewModel
    
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
}

#Preview {
    ContentView(flightsFindService: FlightsFindService(), saveFlightsService: SaveFlightsService())
}
