//
//  FlightsListView.swift
//  SkyBargain
//

import SwiftUI

struct FlightsListView: View {
    
    init(flightsFindService: FlightsFindService, saveFlightsService: SaveFlightsService) {
        self._viewModel = StateObject(wrappedValue: FlightsListViewModel(flightsFindService: flightsFindService, saveFlightsService: saveFlightsService))
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView(showsIndicators: false) {
                    if let flights = viewModel.cheapFlights?.flights {
                        LazyVStack(alignment: .leading, spacing: 16, content: {
                            ForEach(flights, id: \.self) { flight in
                                NavigationLink(destination: FlightDetailView(flight: flight, like: {
                                    viewModel.putLikeOnFlight(flightId: flight.id.uuidString)
                                })) {
                                    FlightCellView(flight: flight, like: {
                                        viewModel.putLikeOnFlight(flightId: flight.id.uuidString)
                                    })
                                }
                                .tint(Color.black)
                                
                                Divider()
                            }
                        })
                    }
                }
                .padding(16)
                .refreshable {
                    viewModel.refresh()
                }
                
                //Loading view
                Group {
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .ignoresSafeArea(.all)
                        .foregroundColor(Color.white.opacity(0.8))
                    ProgressView()
                }
                .opacity(viewModel.isLoading ? 1.0 : 0)
            }
        }
        
    }
    
    @StateObject private var viewModel: FlightsListViewModel
}
