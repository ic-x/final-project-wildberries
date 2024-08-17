//
//  ContentView.swift
//  SkyBargain
//

import SwiftUI

struct ContentView: View {
    @StateObject private var flightsFindService: FlightsFindService = .init()
    
    var body: some View {
        FlightsListView(flightsFindService: flightsFindService)
    }
}

#Preview {
    ContentView()
}
