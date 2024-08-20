//
//  ContentView.swift
//  SkyBargain
//

import SwiftUI

struct ContentView: View {
    @AppStorage("hasSeenWelcomeScreen") var hasSeenWelcomeScreen: Bool = false
    @EnvironmentObject var flightsFindService: FlightsFindService
    @EnvironmentObject var saveFlightsService: SaveFlightsService

    var body: some View {
        switch hasSeenWelcomeScreen {
        case false:
            WelcomeView()
        default:
            MainView()
        }
    }
}

//#Preview {
//    ContentView()
//}
