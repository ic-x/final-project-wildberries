//
//  SkyBargainApp.swift
//  SkyBargain
//
//  Created by ARMBP on 8/16/24.
//

import SwiftUI

@main
struct SkyBargainApp: App {
    
    @StateObject var flightsFindService: FlightsFindService = .init()
    
    var body: some Scene {
        WindowGroup {
            FlightsListView(flightsFindService: flightsFindService)
        }
    }
}
