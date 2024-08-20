//
//  FlightsListView.swift
//  SkyBargain
//

import SwiftUI
import UI

struct FlightsListView: View {
    
    @StateObject private var viewModel = FlightsListViewModel(flightsFindService: nil, saveFlightsService: nil)
    @EnvironmentObject var flightsFindService: FlightsFindService
    @EnvironmentObject var saveFlightsService: SaveFlightsService
    @Binding var searchByCity: String
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                if let flights = viewModel.cheapFlights?.flights {
                    LazyVStack(alignment: .leading, spacing: 16) {
                        ForEach(flights.filter({ !searchByCity.isEmpty ? $0.endCity!.lowercased().contains(searchByCity.lowercased()) || $0.startCity!.lowercased().contains(searchByCity.lowercased()) : true
                        }), id: \.imageWebpUrl) { flight in
                            NavigationLink(
                                destination: FlightDetailsView(
                                    flight: flight,
                                    like: {
                                        viewModel.putLikeOnFlight(flightId: flight.imageWebpUrl ?? "")
                                    }
                                )
                            ) {
                                FlightCellView(
                                    flight: flight,
                                    like: {
                                        viewModel.putLikeOnFlight(flightId: flight.imageWebpUrl ?? "")
                                    }
                                )
                            }
                            .tint(Color.black)
                            
                            Divider()
                        }
                    }
                }
            }
            .padding(16)
            .refreshable {
                viewModel.refresh()
            }
            
            Group {
                CustomProgressView()
            }
            .opacity(viewModel.isLoading ? 1.0 : 0)
        }
        .onAppear {
            viewModel.setup(flightsFindService: flightsFindService, saveFlightsService: saveFlightsService)
        }
    }
}

