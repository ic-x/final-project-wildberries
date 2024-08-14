//
//  SkyBargainApp.swift
//  SkyBargain
//

import SwiftUI
import SwiftData

@main
struct SkyBargainApp: App {
    
    @StateObject var tripFindService: TripFindService = .init()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            TripSwiftDataModel.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            TripsListView(tripFindService: tripFindService)
               
        }
        .modelContainer(sharedModelContainer)
    }
}
