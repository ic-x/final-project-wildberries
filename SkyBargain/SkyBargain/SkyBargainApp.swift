//
//  SkyBargainApp.swift
//  SkyBargain
//

import SwiftUI
import UI

@main
struct SkyBargainApp: App {
    @AppStorage("hasSeenWelcomeScreen") var hasSeenWelcomeScreen: Bool = false
    
    @StateObject private var flightsFindService: FlightsFindService = .init()
    @StateObject private var saveFlightsService: SaveFlightsService = .init()
    
    init() {
        UI.setup()
    }
    
    var body: some Scene {
        WindowGroup {
            switch hasSeenWelcomeScreen {
            case false:
                WelcomeView()
            default:
//                ContentView(flightsFindService: flightsFindService, saveFlightsService: saveFlightsService)
                MainView()
            }
        }
    }
}
