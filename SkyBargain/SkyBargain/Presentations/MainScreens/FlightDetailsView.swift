//
//  FlightDetailsView.swift
//  SkyBargain
//

import SwiftUI
import UI

struct FlightDetailsView: View {
    private var like: () -> Void
    @State private var flight: Flight
    @State private var isLiked: Bool = false
    @State private var isSeatMapPresented: Bool = false
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var saveFlightsService: SaveFlightsService
    
    init(flight: Flight, like: @escaping () -> Void) {
        self._flight = State(initialValue: flight)
        self.like = like
        _isLiked = State(initialValue: false)
    }
    
    var body: some View {
        ZStack {
            Color.brandBackground
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 32) {
                    
                    FlightMapView()
                        .clipShape(Circle())
                        .frame(width: 350, height: 350)
                        .shadow(color: .brandAccentColor.opacity(0.5), radius: 20)
                    
                    
                    flightDetails
                        .padding(.horizontal)
                    
                    PrimaryButton(action: {
                        isSeatMapPresented.toggle()
                    }) {
                        Text("Показать схему сидений")
                    }
                    .shadow(color: .brandAccentColor.opacity(0.7), radius: 5)
                }
                .padding(16)
            }
            .onAppear {
                isLiked = saveFlightsService.isIDSaved(flight.imageWebpUrl ?? "")
            }
            .sheet(isPresented: $isSeatMapPresented) {
                ZStack {
                    Color.brandBackground
                        .ignoresSafeArea()
                    
                    AircraftSeatMapView()
                        .padding()
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.brandAccentColor)
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                LikeButton(isLiked: $isLiked) {
                    like()
                }
            }
        }
    }
    
    private var flightDetails: some View {
        VStack(alignment: .leading, spacing: 8) {
            detailRow(title: "Город отправления:", value: flight.startCity ?? "-")
            detailRow(title: "Город прибытия:", value: flight.endCity ?? "-")
            detailRow(title: "Дата отправления:", value: flight.startDate?.dateFromStringConverter ?? "-")
            detailRow(title: "Дата возвращения:", value: flight.endDate?.dateFromStringConverter ?? "-")
            detailRow(title: "Цена в рублях:", value: "\(flight.price ?? 0)₽")
        }
        .padding()
        .padding(.horizontal, 4)
        .background(.ultraThinMaterial)
        .cornerRadius(30)
        .shadow(radius: 10)
    }
    
    private func detailRow(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .font(.body1)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .font(.body1)
                .foregroundColor(.text)
        }
        .padding(.vertical, 4)
    }
}
