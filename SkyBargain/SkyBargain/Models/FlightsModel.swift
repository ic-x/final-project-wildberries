//
//  FlightshModel.swift
//  SkyBargain
//

import Foundation

struct Flights: Codable {
    let flights: [Flight]?
}

struct Flight: Codable, Hashable {
    let id = UUID()
    private enum CodingKeys : String, CodingKey { case startDate,
                                                       endDate,
                                                       startLocationCode,
                                                       endLocationCode,
                                                       startCity,
                                                       endCity,
                                                       serviceClass,
                                                       seats,
                                                       price,
                                                       searchToken,
                                                       imageUrl,
                                                       imageWebpUrl,
                                                       airlineCode,
                                                       isLiked
    }
    
    let startDate: String?
    let endDate: String?
    let startLocationCode: String?
    let endLocationCode: String?
    let startCity: String?
    let endCity: String?
    let serviceClass: String?
    let seats: [Seat]?
    let price: Int?
    let searchToken: String?
    let imageUrl: String?
    let imageWebpUrl: String?
    let airlineCode: String?
    let isLiked: Bool
}

struct Seat: Codable, Hashable {
    let passengerType: String?
    let count: Int?
}

extension Flight{
    static func ==(lhs: Flight, rhs: Flight) -> Bool {
        return lhs.id == rhs.id
    }
}
