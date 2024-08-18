//
//  AircraftLegendItem.swift
//

import SwiftUI

struct AircraftLegendItem: View {
    var color: Color
    var description: String
    
    var body: some View {
        HStack {
            Rectangle()
                .fill(color)
                .frame(width: 20, height: 20)
                .cornerRadius(4)
            Text(description)
                .font(.body2)
                .foregroundStyle(Color.buttonText)
        }
    }
}

#Preview {
    AircraftLegendItem(color: .blue, description: "Sample Description")
}
