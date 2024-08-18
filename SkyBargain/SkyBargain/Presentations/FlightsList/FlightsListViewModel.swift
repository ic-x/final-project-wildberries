//
//  FlightsListViewModel.swift
//  SkyBargain
//

import SwiftUI
import Combine

final class FlightsListViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var cheapFlights: Flights?
    @Published var saveFlightsService: SaveFlightsService
    @Published private var flightsFindService: FlightsFindService
   
    
    var cancellableSet: Set<AnyCancellable> = []
    
    init(flightsFindService: FlightsFindService, saveFlightsService: SaveFlightsService) {
        self.flightsFindService = flightsFindService
        self.saveFlightsService = saveFlightsService
        subscribeToGlights()
        flightsFindService.getFlights()
    }
    
    func refresh() {
        flightsFindService.getFlights()
    }
    
    func putLikeOnFlight(flightId: String) {
        saveFlightsService.trySaveID(flightId)
    }
    
   private func subscribeToGlights() {
        flightsFindService.cheapFlights
            .assign(to: \.cheapFlights, on: self)
            .store(in: &cancellableSet)
        
        flightsFindService.isLoading
            .assign(to: \.isLoading, on: self)
            .store(in: &cancellableSet)
    }
    
 
}
