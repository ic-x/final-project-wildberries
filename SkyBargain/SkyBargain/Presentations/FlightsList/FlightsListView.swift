//
//  FlightsListView.swift
//  SkyBargain
//
//  Created by ARMBP on 8/16/24.
//

import SwiftUI

struct FlightsListView: View {
    
    init(flightsFindService: FlightsFindService) {
        self.flightsListViewModel = FlightsListViewModel(flightsFindService: flightsFindService)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView(showsIndicators: false) {
                    LazyVStack(alignment: .leading, spacing: 16, content: {
                        ForEach(flightsListViewModel.cheapFlights?.flights ?? [], id: \.self) { flight in
                            NavigationLink(destination: FlightDetailView(flight: flight, like: {
                                print("")
                            })) {
                                FlightsCellView(flight: flight, like: {
                                    print("")
                                })
                            }
                            .tint(Color.black)
                            
                            Divider()
                        }
                    })
                }
                .padding(16)
                .refreshable {
                    flightsListViewModel.refresh()
                }
                
                //Loading view
                Group {
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .ignoresSafeArea(.all)
                        .foregroundColor(Color.white.opacity(0.8))
                    ProgressView()
                }
                .opacity(flightsListViewModel.isLoading ? 1.0 : 0)
            }
        }
       
    }
    
    @ObservedObject var flightsListViewModel: FlightsListViewModel
}

//#Preview {
//    FlightsListView()
//}
