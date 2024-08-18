//
//  ContentView.swift
//  SkyBargain
//

import SwiftUI

struct ContentView: View {

    init(flightsFindService: FlightsFindService, saveFlightsService: SaveFlightsService) {
        self._viewModel = StateObject(wrappedValue: .init(flightsFindService: flightsFindService, saveFlightsService: saveFlightsService))
    }
    var body: some View {
        FlightsListView(viewModel: viewModel)
    }
    
    @StateObject private var viewModel: FlightsListViewModel
}

#Preview {
    ContentView(flightsFindService: FlightsFindService(), saveFlightsService: SaveFlightsService())
}
