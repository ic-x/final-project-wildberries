//
//  FlightCellView.swift
//  SkyBargain
//

import SwiftUI
import UI

struct FlightCellView: View {
    @State private var isLiked: Bool = false
    @State private var flight: Flight
    @EnvironmentObject private var saveFlightsService: SaveFlightsService
    private var like: () -> Void
    
    init(flight: Flight, like: @escaping () -> Void) {
        self.flight = flight
        self.like = like
        _isLiked = State(initialValue: false)
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
            .padding(.trailing, 20)
        }
        .onAppear {
            isLiked = saveFlightsService.isIDSaved(flight.imageWebpUrl ?? "")
        }
    }
}
