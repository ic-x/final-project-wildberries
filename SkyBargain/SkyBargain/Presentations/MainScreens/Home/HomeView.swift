//
//  HomeView.swift
//  SkyBargain
//

import SwiftUI
import UI

struct HomeView: View {
    @ObservedObject private var viewModel: FlightsListViewModel
    
    init(viewModel: FlightsListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color.brandBackground
                .ignoresSafeArea()
            
            AirplaneSketchBackgroundView()
                .dropIn()
            FlightsListView(viewModel: viewModel)
        }
    }
}

//#Preview {
//    HomeView()
//}
