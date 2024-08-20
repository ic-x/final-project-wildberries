//
//  SweepView.swift
//

import SwiftUI

public struct SweepView: View {
    @State private var startOffset: CGFloat = -2.0
    @State private var endOffset: CGFloat = -1.0
    
    public init() {}

    public var body: some View {
        GeometryReader { geometry in
            LinearGradient(
                gradient: Gradient(colors: [Color.clear, Color.white.opacity(0.7), Color.clear]),
                startPoint: .bottomLeading,
                endPoint: .topTrailing
            )
            .mask(
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.clear, Color.white.opacity(0.7), Color.clear]),
                            startPoint: UnitPoint(x: startOffset, y: startOffset),
                            endPoint: UnitPoint(x: endOffset, y: endOffset)
                        )
                    )
            )
            .onAppear {
                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                    startOffset = 1.0
                    endOffset = 2.0
                }
            }
        }
        .allowsHitTesting(false)
    }
}

#Preview {
    SweepView()
        .background(Color.black)
        .ignoresSafeArea()
}
