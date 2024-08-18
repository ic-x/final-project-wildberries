//
//  FlightshModel.swift
//  SkyBargain
//

import Foundation

struct Flights: Codable {
    let flights: [Flight]?
}

struct Flight: Codable {
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
}

struct Seat: Codable {
    let passengerType: String?
    let count: Int?
}
