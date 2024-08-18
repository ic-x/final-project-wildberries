//
//  LikeButtonView.swift
//

import SwiftUI

@MainActor @preconcurrency
public struct LikeButton: View {
    @Binding var isLiked: Bool
    @State private var isPressed: Bool = false
    @State private var currentColor: Color = .gray
    public var action: () -> Void

    public init(isLiked: Binding<Bool>, action: @escaping () -> Void) {
        self._isLiked = isLiked
        self.action = action
    }

    public var body: some View {
        Button(action: {
            let animationDuration = isLiked ? 0.2 : 0.1

            withAnimation(.easeInOut(duration: animationDuration)) {
                isPressed = true
                isLiked.toggle()
            }
            action()
            animateColorChange(for: isLiked)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + (isLiked ? 0.6 : 0.45)) {
                withAnimation(.spring()) {
                    isPressed = false
                }
            }
        }) {
            Image(systemName: isLiked ? "suit.heart.fill" : "suit.heart")
                .foregroundColor(currentColor)
                .font(.system(size: 24))
                .scaleEffect(isPressed ? 1.3 : 1.0)
        }
        .animation(.spring(), value: isPressed)
    }

    private func animateColorChange(for isLiked: Bool) {
        let purpleDelay = isLiked ? 0.0 : 0.0
        let redDelay = isLiked ? 0.3 : 0.2
        let finalColorDelay = isLiked ? 0.6 : 0.4
        
        DispatchQueue.main.asyncAfter(deadline: .now() + purpleDelay) {
            withAnimation(.easeInOut(duration: 0.3)) {
                currentColor = .purple
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + redDelay) {
            withAnimation(.easeInOut(duration: 0.3)) {
                currentColor = .red
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + finalColorDelay) {
            withAnimation(.easeInOut(duration: 0.3)) {
                currentColor = isLiked ? .red : .gray
            }
        }
    }
}
