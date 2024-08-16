//
//  SkyBargainApp.swift
//  SkyBargain
//

import SwiftUI

@main
struct SkyBargainApp: App {

    @StateObject private var flightsFindService: FlightsFindService = .init()
  
    var body: some Scene {
        WindowGroup {
            FlightsListView(flightsFindService: flightsFindService)
        }
    }
}
