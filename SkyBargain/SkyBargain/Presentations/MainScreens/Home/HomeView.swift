//
//  HomeView.swift
//  SkyBargain
//

import SwiftUI
import UI

struct HomeView: View {
    
    @State private var searchedFlight: String = ""
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
                    SearchTextField(text: $searchedFlight)
                        .padding(.horizontal)
                    
                    FlightsListView(searchByCity: $searchedFlight)
                }
                .padding([.horizontal, .top])
            }
        }
    }
}
//#Preview {
//    HomeView()
//}
