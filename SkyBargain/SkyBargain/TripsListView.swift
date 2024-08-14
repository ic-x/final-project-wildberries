//
//  TripsListView.swift
//  SkyBargain
//

import SwiftUI

struct TripsListView: View {
    
    init(tripFindService: TripFindService) {
        self.tripListViewModel = TripListViewModel(tripFindService: tripFindService)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView(showsIndicators: false) {
                    LazyVStack(alignment: .leading, spacing: 16, content: {
                        ForEach(tripListViewModel.cheapFlights?.flights ?? [], id: \.self) { flight in
                            NavigationLink(destination: TripDetailView(flight: flight, like: {
                                print("")
                            })) {
                                TripCell(flight: flight, like: {
                                    print("")
                                })
                            }
                            .tint(Color.black)
                            
                            Divider()
                        }
                    })
                }
                .padding(16)
                .refreshable {
                    tripListViewModel.refresh()
                }
                
                //Loading view
                Group {
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .ignoresSafeArea(.all)
                        .foregroundColor(Color.white.opacity(0.8))
                    ProgressView()
                }
                .opacity(tripListViewModel.isLoading ? 1.0 : 0)
            }
        }
       
    }
    
    @ObservedObject var tripListViewModel: TripListViewModel
    @Environment(\.modelContext) private var modelContext
}

//#Preview {
//    TripsListView()
//}
