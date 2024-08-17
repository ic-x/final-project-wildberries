//
//  UIModuleExamplesView.swift
//  SkyBargain
//

import SwiftUI
import UI

struct UIModuleExamplesView: View {
    var body: some View {
        Text("Hello, World!")
            .font(.heading1)
            .fadeIn()
        
        
        VStack {
            Text("brandBackground")
                .foregroundStyle(Color.brandBackground)
            Text("safe")
                .foregroundStyle(Color.safe)
        }
        
        
        PrimaryButton(title: "Click Me") {
            print("Button was clicked!")
        }
        
        
        Text("Custom Font Example")
            .font(.body2)
        Text("Custom Font Example")
            .font(.body1)
        
        
        ResponsiveGrid(items: (1...8).map { index in
            Text("Item \(index)")
                .padding()
                .background(Color.safe)
                .cornerRadius(8)
        }, columns: 3)
        .padding()
        
        
        VStack(spacing: 20) {
            Text("Hello, World!")
                .font(.largeTitle)
                .slideAndScale()
            
            PrimaryButton(title: "Click Me") {
                print("Button Clicked")
            }
            .slideAndScale(offset: 100)
        }
        .padding()
    }
}

#Preview {
    UIModuleExamplesView()
}
