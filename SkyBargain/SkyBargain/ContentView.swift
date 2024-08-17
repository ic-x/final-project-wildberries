//
//  ContentView.swift
//  SkyBargain
//

import SwiftUI

struct ContentView: View {
    @StateObject private var flightsFindService: FlightsFindService = .init()
    @StateObject private var saveFlightsService: SaveFlightsService = .init()
    
    var body: some View {
        FlightsListView(flightsFindService: flightsFindService, saveFlightsService: saveFlightsService)
        
    }
}

#Preview {
    ContentView()
}
