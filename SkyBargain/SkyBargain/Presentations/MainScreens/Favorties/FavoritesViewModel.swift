//
//  FavoritesViewModel.swift
//  SkyBargain
//

import SwiftUI
import Combine

final class FavoritesViewModel: ObservableObject {
    @Published var favoriteFlights: [Flight] = []
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    func loadFavoriteFlights(flights: [Flight], saveFlightsService: SaveFlightsService) {
        let savedIDs = saveFlightsService.savedIDs
        self.favoriteFlights = flights.filter { flight in
            guard let id = flight.imageWebpUrl else { return false }
            return savedIDs.contains(id)
        }
    }
}
