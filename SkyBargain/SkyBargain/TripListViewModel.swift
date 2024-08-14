//
//  TripListViewModel.swift
//  SkyBargain
//

import SwiftUI
import Combine

final class TripListViewModel: ObservableObject {
    @Published var isLoading: Bool = false
   
    
    init(tripFindService: TripFindService) {
        self.tripFindService = tripFindService
        subscribeToGlights()
        tripFindService.getTrips()
    }
    
    
    func refresh() {
        tripFindService.getTrips()
    }
    func putLikeOnTrip(tripId: Int) {
        
        print("Liked trip by ID: ", tripId)//debug
    }
    
    func subscribeToGlights() {
        tripFindService.cheapFlights
            .assign(to: \.cheapFlights, on: self)
            .store(in: &cancellableSet)
        
        tripFindService.isLoading
            .assign(to: \.isLoading, on: self)
            .store(in: &cancellableSet)
    }
    
    var cancellableSet: Set<AnyCancellable> = []
    @Published var cheapFlights: Flights? = nil
    @Published private var tripFindService: TripFindService
}
