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
            
            VStack {
                SearchTextField(text: .constant(""))
                
                FlightsListView(viewModel: viewModel)
            }
        }
    }
}

//#Preview {
//    HomeView()
//}
