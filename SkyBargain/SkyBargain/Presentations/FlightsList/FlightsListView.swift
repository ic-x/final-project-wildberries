//
//  FlightsListView.swift
//  SkyBargain
//

import SwiftUI

struct FlightsListView: View {
    
    init(flightsFindService: FlightsFindService) {
        self.flightsFindService = FlightsListViewModel(flightsFindService: flightsFindService)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView(showsIndicators: false) {
                    LazyVStack(alignment: .leading, spacing: 16, content: {
                        ForEach(flightsFindService.cheapFlights?.flights ?? [], id: \.self) { flight in
                            NavigationLink(destination: FlightDetailView(flight: flight, like: {
                                print("")
                            })) {
                                FlightCellView(flight: flight, like: {
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
                    flightsFindService.refresh()
                }
                
                //Loading view
                Group {
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .ignoresSafeArea(.all)
                        .foregroundColor(Color.white.opacity(0.8))
                    ProgressView()
                }
                .opacity(flightsFindService.isLoading ? 1.0 : 0)
            }
        }
        
    }
    
    @ObservedObject var flightsFindService: FlightsListViewModel
}
