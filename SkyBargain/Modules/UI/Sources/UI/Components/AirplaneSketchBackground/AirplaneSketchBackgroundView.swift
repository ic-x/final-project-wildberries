//
//  AirplaneSketchBackgroundView.swift
//

import SwiftUI

@MainActor @preconcurrency
public struct AirplaneSketchBackgroundView: View {
    @State private var wobble: Bool = false
    
    public init() {}
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                let airplanes = [
                    (size: 0.4, xOffset: -0.3, yOffset: -0.4, rotation: -10.0),
                    (size: 0.2, xOffset: -0.5, yOffset: -0.1, rotation: 5.0),
                    (size: 0.3, xOffset: 0.1, yOffset: -0.3, rotation: 15.0),
                    (size: 0.5, xOffset: -0.4, yOffset: 0.3, rotation: -5.0),
                    (size: 0.35, xOffset: 0.3, yOffset: -0.5, rotation: 0.0),
                    (size: 0.25, xOffset: 0.5, yOffset: 0.2, rotation: -15.0),
                    (size: 0.15, xOffset: -0.2, yOffset: 0.4, rotation: 10.0),
                    (size: 0.45, xOffset: 0.4, yOffset: -0.2, rotation: 20.0),
                    (size: 0.3, xOffset: -0.1, yOffset: 0.1, rotation: -20.0),
                    (size: 0.25, xOffset: 0.2, yOffset: 0.5, rotation: 5.0)
                ]
                
                ForEach(0..<airplanes.count, id: \.self) { index in
                    let airplane = airplanes[index]
                    AirplaneView(
                        size: airplane.size,
                        xOffset: airplane.xOffset,
                        yOffset: airplane.yOffset,
                        rotation: airplane.rotation,
                        geometrySize: geometry.size,
                        wobble: wobble
                    )
                }
            }
            .onAppear {
                wobble.toggle()
            }
        }
    }
}

#Preview {
    AirplaneSketchBackgroundView()
}
