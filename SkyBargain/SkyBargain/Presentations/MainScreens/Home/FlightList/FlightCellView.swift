//
//  FlightCellView.swift
//  SkyBargain
//

import SwiftUI

struct FlightCellView: View {
    
    @State private var flight: Flight
    @ObservedObject private var saveFlightsService: SaveFlightsService
    private var like: () -> Void
    
    init(flight: Flight, saveFlightsService: SaveFlightsService, like: @escaping () -> Void) {
        self.flight = flight
        self.like = like
        self.saveFlightsService = saveFlightsService
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
            
            Button {
                like()
            } label: {
                Image(systemName: saveFlightsService.isIDSaved(flight.imageWebpUrl ?? "") ? "heart.fill" : "heart")
                    .font(.title)
                    .foregroundStyle(Color.purple)
            }
        }
    }
}
