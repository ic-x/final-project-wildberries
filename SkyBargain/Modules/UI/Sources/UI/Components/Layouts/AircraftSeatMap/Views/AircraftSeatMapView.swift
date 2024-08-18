//
//  AircraftSeatMapView.swift
//

import SwiftUI

public struct AircraftSeatMapView: View {
    @State var rows: [[AircraftSeat?]]
    
    public init(rows: [[AircraftSeat?]] = [
        // First Class (1+1 layout with extra space)
        [AircraftSeat(number: "1A"), nil, nil, nil, AircraftSeat(number: "1D")],
        [AircraftSeat(number: "2A", isAvailable: false), nil, nil, nil, AircraftSeat(number: "2D")],
        
        // Spacer for transition between classes
        [nil, nil, nil, nil, nil],
        
        // Business Class (2+2 layout)
        [AircraftSeat(number: "3A"), AircraftSeat(number: "3B"), nil, AircraftSeat(number: "3C"), AircraftSeat(number: "3D")],
        [AircraftSeat(number: "4A"), AircraftSeat(number: "4B", isSelected: true), nil, AircraftSeat(number: "4C"), AircraftSeat(number: "4D", isAvailable: false)],
        [AircraftSeat(number: "5A"), AircraftSeat(number: "5B"), nil, AircraftSeat(number: "5C"), AircraftSeat(number: "5D")],
        
        // Emergency exit row with extra legroom
        [nil, AircraftSeat(number: "6B", isAvailable: false), AircraftSeat(number: "6C"), AircraftSeat(number: "6D"), nil],
        
        // Spacer for transition between classes
        [nil, nil, nil, nil, nil],
        
        // Economy Class (3+3 layout)
        [AircraftSeat(number: "7A"), AircraftSeat(number: "7B"), AircraftSeat(number: "7C"), nil, AircraftSeat(number: "7D"), AircraftSeat(number: "7E"), AircraftSeat(number: "7F")],
        [AircraftSeat(number: "8A", isSelected: false), AircraftSeat(number: "8B"), AircraftSeat(number: "8C"), nil, AircraftSeat(number: "8D"), AircraftSeat(number: "8E"), AircraftSeat(number: "8F")],
        [AircraftSeat(number: "9A"), AircraftSeat(number: "9B", isAvailable: false), AircraftSeat(number: "9C"), nil, AircraftSeat(number: "9D"), AircraftSeat(number: "9E"), AircraftSeat(number: "9F")],
        [AircraftSeat(number: "10A"), AircraftSeat(number: "10B"), AircraftSeat(number: "10C"), nil, AircraftSeat(number: "10D"), AircraftSeat(number: "10E"), AircraftSeat(number: "10F")],
        [AircraftSeat(number: "11A"), AircraftSeat(number: "11B"), AircraftSeat(number: "11C"), nil, AircraftSeat(number: "11D"), AircraftSeat(number: "11E", isSelected: false), AircraftSeat(number: "11F", isAvailable: false)]
    ]) {
        self._rows = State(initialValue: rows)
    }
    
    public var body: some View {
        VStack(spacing: 16) {
            ForEach(0..<rows.count, id: \.self) { index in
                AircraftRowView(seats: $rows[index])
            }
            
            HStack {
                AircraftLegendItem(color: .gray, description: "Available")
                AircraftLegendItem(color: .green, description: "Selected")
                AircraftLegendItem(color: .red, description: "Unavailable")
            }
            .padding(.top, 20)
        }
        .padding()
    }
}

#Preview {
    AircraftSeatMapView()
}
