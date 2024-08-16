//
//  FlightsFindService.swift
//  SkyBargain
//
//  Created by ARMBP on 8/16/24.
//

import Foundation
import Combine

final class FlightsFindService: ObservableObject {
    
    var cheapFlights: CurrentValueSubject<Flights?, Never> = .init(nil)
    var isLoading: CurrentValueSubject<Bool, Never> = .init(false)
    
    private func fetchCheapFlights() async throws {
        isLoading.value = true
        guard let url = URL(string: "https://vmeste.wildberries.ru/stream/api/avia-service/v1/suggests/getCheap")
                
        else {
            fatalError("Missing URL")
        }
        
        var urlRequest = URLRequest(url: url, timeoutInterval: Double.infinity)
        urlRequest.httpMethod = "POST"
        
        urlRequest.addValue("vmeste.wildberries.ru", forHTTPHeaderField: "authority")
        urlRequest.addValue("application/json, text/plain, */*", forHTTPHeaderField: "accept")
        urlRequest.addValue("no-cache", forHTTPHeaderField: "cache-control")
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.addValue("https://vmeste.wildberries.ru", forHTTPHeaderField: "origin")
        urlRequest.addValue("no-cache", forHTTPHeaderField: "pragma")
        urlRequest.addValue("https://vmeste.wildberries.ru/avia", forHTTPHeaderField: "referer")
        urlRequest.addValue("empty", forHTTPHeaderField: "sec-fetch-dest")
        urlRequest.addValue("cors", forHTTPHeaderField: "sec-fetch-mode")
        urlRequest.addValue("same-origin", forHTTPHeaderField: "sec-fetch-site")
        
        urlRequest.httpBody = try JSONSerialization.data(withJSONObject: ["startLocationCode": "LED"])
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        
        try await MainActor.run {
            cheapFlights.value = try JSONDecoder().decode(Flights.self, from: data)
            isLoading.value = false
        }
    }
    
    func getFlights() {
        Task {
            do {
                try await fetchCheapFlights()
            } catch {
                print("Error fetching data: \(error)")
            }
        }
    }
}

