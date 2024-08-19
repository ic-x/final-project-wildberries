//
//  FlightsListView.swift
//  SkyBargain
//

import SwiftUI
import UI

struct FlightsListView: View {
    
    init(viewModel: FlightsListViewModel) {
        self.viewModel = viewModel
    }
    
   
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView(showsIndicators: false) {
                    if let flights = viewModel.cheapFlights?.flights {
                        LazyVStack(alignment: .leading, spacing: 16, content: {
                            ForEach(flights, id: \.imageWebpUrl) { flight in
                                NavigationLink(destination: FlightDetailView(flight: flight, saveFlightsService: viewModel.saveFlightsService, like: {
                                    viewModel.putLikeOnFlight(flightId: flight.imageWebpUrl ?? "")
                                })) {
                                    FlightCellView(flight: flight, saveFlightsService: viewModel.saveFlightsService, like: {
                                        viewModel.putLikeOnFlight(flightId: flight.imageWebpUrl ?? "")
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
//                    Rectangle()
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                        .ignoresSafeArea(.all)
//                        .foregroundColor(Color.white.opacity(0.8))
                    
                    CustomProgressView()
                }
                .opacity(viewModel.isLoading ? 1.0 : 0)
            }
        }
        
    }
    
    @ObservedObject private var viewModel: FlightsListViewModel
}
