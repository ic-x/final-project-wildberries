//
//  AircraftRowView.swift
//

import SwiftUI

struct AircraftRowView: View {
    @Binding var seats: [AircraftSeat?]
    
    var body: some View {
        HStack(spacing: 16) {
            ForEach(seats.indices, id: \.self) { index in
                AircraftSeatView(seat: $seats[index])
            }
        }
    }
}
