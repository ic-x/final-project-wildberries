//
//  FavoritesView.swift
//  SkyBargain
//

import SwiftUI
import UI

struct FavoritesView: View {
    var body: some View {
        ZStack {
            Color.brandBackground
                .ignoresSafeArea()
            
            AirplaneSketchBackgroundView()
                .dropIn()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    FavoritesView()
}
