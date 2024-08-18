//
//  AircraftSeatView.swift
//

import SwiftUI

struct AircraftSeatView: View {
    @Binding var seat: AircraftSeat?
    @State private var isAnimating = false

    var body: some View {
        Group {
            if let seat = seat {
                Text(seat.number)
                    .frame(width: 40, height: 40)
                    .background(seat.isSelected ? Color.green : (seat.isAvailable ? Color.gray : Color.red))
                    .foregroundStyle(Color.buttonText)
                    .cornerRadius(8)
                    .scaleEffect(seat.isSelected ? 1.2 : 1.0)
                    .animation(.easeInOut(duration: 0.2), value: seat.isSelected)
                    .overlay(
                        seat.isSelected ? SweepView().clipShape(RoundedRectangle(cornerRadius: 8)) : nil
                    )
                    .onTapGesture {
                        if seat.isAvailable {
                            withAnimation {
                                self.seat?.isSelected.toggle()
                            }
                        }
                    }
            } else {
                Spacer().frame(width: 40)
            }
        }
    }
}

#Preview {
    AircraftSeatView(seat: .constant(AircraftSeat(number: "12A", isAvailable: true, isSelected: false)))
}
