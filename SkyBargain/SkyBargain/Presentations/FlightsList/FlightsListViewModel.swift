//
//  FlightsListViewModel.swift
//  SkyBargain
//

import SwiftUI
import Combine

final class FlightsListViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var cheapFlights: Flights?
    @Published private var flightsFindService: FlightsFindService
    @Published private var saveFlightsService: SaveFlightsService
    
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
        saveFlightsService.saveID(flightId)
    }
    
    func subscribeToGlights() {
        flightsFindService.cheapFlights
            .assign(to: \.cheapFlights, on: self)
            .store(in: &cancellableSet)
        
        flightsFindService.isLoading
            .assign(to: \.isLoading, on: self)
            .store(in: &cancellableSet)
    }
    
 
}
