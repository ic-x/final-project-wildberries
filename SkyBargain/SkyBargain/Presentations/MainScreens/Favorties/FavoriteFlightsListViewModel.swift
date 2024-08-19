//
//  FavoriteFlightsListViewModel.swift
//  SkyBargain
//
//  Created by ARMBP on 8/19/24.
//

import SwiftUI
import Combine

final class FavoriteFlightsListViewModel: ObservableObject {
    
    @Published var cheapFlights: [Flight]?
    @Published var saveFlightsService: SaveFlightsService
    @Published private var flightsFindService: FlightsFindService
    private var cancellableSet: Set<AnyCancellable> = []
   
    init(flightsFindService: FlightsFindService, saveFlightsService: SaveFlightsService) {
        self.flightsFindService = flightsFindService
        self.saveFlightsService = saveFlightsService
    }
    
    func putLikeOnFlight(flightId: String) {
        saveFlightsService.trySaveID(flightId)
    }
    
    func refreshFavorites() {
        cheapFlights = flightsFindService.cheapFlights.value?.flights?.filter({ saveFlightsService.isIDSaved($0.imageWebpUrl ?? UUID().uuidString)})
        //с combine не получилось это сделать
    }
}
