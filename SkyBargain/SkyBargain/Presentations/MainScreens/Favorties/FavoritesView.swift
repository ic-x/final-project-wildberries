//
//  FavoritesView.swift
//  SkyBargain
//

import SwiftUI
import UI

struct FavoritesView: View {
    @EnvironmentObject var saveFlightsService: SaveFlightsService
    @EnvironmentObject var flightsFindService: FlightsFindService
    @StateObject private var viewModel = FavoritesViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.brandBackground
                    .ignoresSafeArea()

                AirplaneSketchBackgroundView()
                    .dropIn()
                
                VStack {
                    ZStack {
                        SearchTextField(text: .constant("")).opacity(0)
                            .padding(.horizontal)
                        
                        Text("Избранное")
                            .font(.subheading1)
                    }
                    
                    ScrollView(showsIndicators: false) {
                        if viewModel.favoriteFlights.isEmpty {
                            Text("Нет сохраненных полетов")
                                .font(.heading2)
                                .foregroundColor(.gray)
                                .padding(.top, 32)
                        } else {
                            LazyVStack(alignment: .leading, spacing: 16) {
                                ForEach(viewModel.favoriteFlights, id: \.imageWebpUrl) { flight in
                                    NavigationLink(
                                        destination: FlightDetailsView(
                                            flight: flight,
                                            like: {
                                                saveFlightsService.trySaveID(flight.imageWebpUrl ?? "")
                                                viewModel.loadFavoriteFlights(flights: flightsFindService.cheapFlights.value?.flights ?? [], saveFlightsService: saveFlightsService)
                                            }
                                        )
                                    ) {
                                        FlightCellView(
                                            flight: flight,
                                            like: {
                                                saveFlightsService.trySaveID(flight.imageWebpUrl ?? "")
                                                viewModel.loadFavoriteFlights(flights: flightsFindService.cheapFlights.value?.flights ?? [], saveFlightsService: saveFlightsService)
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
                    .offset(x: 0, y: 1.25)
                }
                .padding([.horizontal, .top])
            }
        }
        .onAppear {
            viewModel.loadFavoriteFlights(flights: flightsFindService.cheapFlights.value?.flights ?? [], saveFlightsService: saveFlightsService)
        }
    }
}

//#Preview {
//    FavoritesView()
//}
