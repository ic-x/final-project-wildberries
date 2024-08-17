//
//  FlightsListViewModel.swift
//  SkyBargain
//

import SwiftUI
import Combine

final class FlightsListViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    
    
    init(flightsFindService: FlightsFindService) {
        self.flightsFindService = flightsFindService
        subscribeToGlights()
        flightsFindService.getFlights()
    }
    
    func refresh() {
        flightsFindService.getFlights()
    }
    
    func putLikeOnFlight(flightId: Int) {
        
        print("Liked flight by ID: ", flightId)//debug
    }
    
    func subscribeToGlights() {
        flightsFindService.cheapFlights
            .assign(to: \.cheapFlights, on: self)
            .store(in: &cancellableSet)
        
        flightsFindService.isLoading
            .assign(to: \.isLoading, on: self)
            .store(in: &cancellableSet)
    }
    
    var cancellableSet: Set<AnyCancellable> = []
    @Published var cheapFlights: Flights? = nil
    @Published private var flightsFindService: FlightsFindService
}
