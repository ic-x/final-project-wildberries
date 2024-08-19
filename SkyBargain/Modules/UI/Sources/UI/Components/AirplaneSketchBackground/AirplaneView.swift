//
//  AirplaneView.swift
//

import SwiftUI

@MainActor @preconcurrency
public struct AirplaneView: View {
    let size: CGFloat
    let xOffset: CGFloat
    let yOffset: CGFloat
    let rotation: Double
    let geometrySize: CGSize
    let wobble: Bool
    
    public var body: some View {
        Image(systemName: "airplane")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(Color.brandAccentColor)
            .opacity(0.1)
            .frame(width: geometrySize.width * size)
            .offset(x: geometrySize.width * xOffset,
                    y: geometrySize.height * yOffset)
            .rotationEffect(.degrees(rotation + (wobble ? 2.0 : -2.0)))
            .animation(
                Animation.easeInOut(duration: Double.random(in: 2...4))
                    .repeatForever(autoreverses: true),
                value: wobble
            )
    }
}

#Preview {
    GeometryReader { geometry in
        AirplaneView(
            size: 0.3,
            xOffset: 0.1,
            yOffset: 0.1,
            rotation: 15.0,
            geometrySize: geometry.size,
            wobble: true
        )
    }
    .frame(width: 300, height: 300)
}
