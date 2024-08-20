//
//  WelcomeView.swift
//  SkyBargain
//

import SwiftUI
import UI

struct WelcomeView: View {
    @AppStorage("hasSeenWelcomeScreen") var hasSeenWelcomeScreen: Bool = false
    
    var body: some View {
        ZStack {
            Color.brandBackground
                .ignoresSafeArea()
            
            AirplaneSketchBackgroundView()
                .dropIn()
            
            VStack {
                Text("Это Sky Bargain")
                    .font(.welcomeTitle)
                    .padding()
                
                Spacer()
                    .frame(height: 30)
                
                PrimaryButton(action: {
                    hasSeenWelcomeScreen = true
                }) {
                    Text("Начать")
                        .font(.welcomeText)
                }
            }
            .dropIn()
            .padding()
            
            SweepView()
                .ignoresSafeArea()
        }
    }
}

#Preview {
    WelcomeView()
}
