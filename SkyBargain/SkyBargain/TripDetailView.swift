//
//  TripDetailView.swift
//  SkyBargain
//

import SwiftUI

struct TripDetailView: View {
    
    init(flight: Flight, like: @escaping () -> Void) {
        self.flight = flight
        self.like = like
    }
    
    var body: some View {
        VStack(spacing: 64) {
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
            }
            Button {
                like()
            } label: {
                Image(systemName: /*(tripListViewModel.tripModel?.liked ?? false) ? "heart.fill":*/ "heart")
                    .font(.title)
                    .foregroundStyle(Color.purple)
            }
        }
        .padding(16)
    }
    
    private var like: () -> Void
    @State private var flight: Flight
}

//#Preview {
//    TripDetailView()
//}
