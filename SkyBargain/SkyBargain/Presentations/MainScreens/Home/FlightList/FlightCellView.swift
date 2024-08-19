//
//  FlightCellView.swift
//  SkyBargain
//

import SwiftUI
import UI

struct FlightCellView: View {
    @State private var isLiked: Bool
    
    @State private var flight: Flight
    @ObservedObject private var saveFlightsService: SaveFlightsService
    private var like: () -> Void
    
    init(flight: Flight, saveFlightsService: SaveFlightsService, like: @escaping () -> Void) {
        self.flight = flight
        self.like = like
        self.saveFlightsService = saveFlightsService
        self.isLiked = saveFlightsService.isIDSaved(flight.imageWebpUrl ?? UUID().uuidString)
    }
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Город отправления: ")
                Text("Город прибытия: ")
                Text("Дата отправления: ")
                Text("Дата возвращения: ")
                Text("Цена в рублях: ")
            }
            
            VStack(alignment: .leading, spacing: 16) {
                Text(flight.startCity ?? "-")
                Text(flight.endCity ?? "-")
                Text(flight.startDate?.dateFromStringConverter ?? "-")
                Text(flight.endDate?.dateFromStringConverter ?? "-")
                Text(String(flight.price ?? 0) + "₽")
            }
            
            Spacer()
            
            
            
            LikeButton(isLiked: $isLiked) {
                like()
            }
        }
    }
}
