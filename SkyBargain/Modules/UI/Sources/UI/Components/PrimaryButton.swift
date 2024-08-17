//
//  PrimaryButton.swift
//

import SwiftUI

public struct PrimaryButton: View {
    public var title: String
    public var action: () -> Void
    
    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheading2)
                .lineSpacing(28)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundStyle(Color.buttonText)
                .background(Color.button)
                .cornerRadius(30)
        }
    }
}
