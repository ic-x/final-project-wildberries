//
//  HomeView.swift
//  SkyBargain
//

import SwiftUI
import UI

struct HomeView: View {
    @EnvironmentObject var flightsFindService: FlightsFindService
    @EnvironmentObject var saveFlightsService: SaveFlightsService
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.brandBackground
                    .ignoresSafeArea()
                
                AirplaneSketchBackgroundView()
                    .dropIn()
                
                VStack {
                    SearchTextField(text: .constant(""))
                        .padding(.horizontal)
                    
                    FlightsListView()
                }
                .padding([.horizontal, .top])
            }
        }
    }
}

//#Preview {
//    HomeView()
//}
