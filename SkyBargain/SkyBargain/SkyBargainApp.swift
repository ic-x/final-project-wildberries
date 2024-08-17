//
//  SkyBargainApp.swift
//  SkyBargain
//

import SwiftUI
import UI

@main
struct SkyBargainApp: App {
    init() {
        UI.setup()
    }
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            UIModuleExamplesView()
        }
    }
}
