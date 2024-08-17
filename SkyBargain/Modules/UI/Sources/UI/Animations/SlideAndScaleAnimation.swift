//
//  SlideAndScaleAnimation.swift
//

import SwiftUI

public struct SlideAndScaleAnimation: ViewModifier {
    public var offset: CGFloat
    
    public init(offset: CGFloat = 300) {
        self.offset = offset
    }
    
    @State private var isVisible = false
    
    public func body(content: Content) -> some View {
        content
            .scaleEffect(isVisible ? 1 : 0.5)
            .offset(y: isVisible ? 0 : offset)
            .opacity(isVisible ? 1 : 0)
            .animation(.easeInOut(duration: 0.5), value: isVisible)
            .onAppear {
                isVisible = true
            }
    }
}

extension View {
    public func slideAndScale(offset: CGFloat = 300) -> some View {
        self.modifier(SlideAndScaleAnimation(offset: offset))
    }
}
