//
//  FlightsListViewModel.swift
//  SkyBargain
//
//  Created by ARMBP on 8/16/24.
//

import SwiftUI
import Combine

final class TripListViewModel: ObservableObject {
    @Published var isLoading: Bool = false
   
    init(flightsFindService: FlightsFindService) {
        self.flightsFindService = flightsFindService
        subscribeToGlights()
        flightsFindService.getTrips()
    }
    
    
    func refresh() {
        flightsFindService.getTrips()
    }
    
    func putLikeOnTrip(tripId: Int) {
        print("Liked trip by ID: ", tripId)//debug
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
