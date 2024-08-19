//
//  SkyBargainApp.swift
//  SkyBargain
//

import SwiftUI
import UI

@main
struct SkyBargainApp: App {
    
    @StateObject private var flightsFindService: FlightsFindService = .init()
    @StateObject private var saveFlightsService: SaveFlightsService = .init()
    
    init() {
        UI.setup()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(flightsFindService: flightsFindService, saveFlightsService: saveFlightsService)
        }
    }
}
