//
//  FavoritesView.swift
//  SkyBargain
//

import SwiftUI
import UI

struct FavoritesView: View {
    
    @ObservedObject private var viewModel: FavoriteFlightsListViewModel
    
    init(viewModel: FavoriteFlightsListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color.brandBackground
                .ignoresSafeArea()
            
            AirplaneSketchBackgroundView()
                .dropIn()
            NavigationStack {
                ZStack {
                    ScrollView(showsIndicators: false) {
                        LazyVStack(alignment: .leading, spacing: 16, content: {
                            ForEach(viewModel.cheapFlights ?? [], id: \.imageWebpUrl) { flight in
                                NavigationLink(destination: FlightDetailView(flight: flight, saveFlightsService: viewModel.saveFlightsService, like: {
                                    viewModel.putLikeOnFlight(flightId: flight.imageWebpUrl ?? "")
                                    viewModel.refreshFavorites()
                                })) {
                                    FlightCellView(flight: flight, saveFlightsService: viewModel.saveFlightsService, like: {
                                        viewModel.putLikeOnFlight(flightId: flight.imageWebpUrl ?? "")
                                        viewModel.refreshFavorites()
                                    })
                                }
                                .tint(Color.black)
                                
                                Divider()
                            }
                        })
                    }
                    .padding(16)
                }
            }
        }
        .onAppear {
            viewModel.refreshFavorites()
        }
    }
}

#Preview {
    FavoritesView(viewModel: FavoriteFlightsListViewModel(flightsFindService: FlightsFindService(), saveFlightsService: SaveFlightsService()))
}
