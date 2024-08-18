//
//  UIModuleFlightMapView.swift
//  SkyBargain
//

import SwiftUI
import UI
import MapKit

struct UIModuleFlightMapView: View {
    var body: some View {
        FlightMapView()
            .ignoresSafeArea()
    }
}

#Preview {
    UIModuleFlightMapView()
}
