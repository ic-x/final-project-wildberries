//
//  AircraftSeat.swift
//

import Foundation

public struct AircraftSeat: Identifiable {
    public let id = UUID()
    public let number: String
    public var isAvailable: Bool
    public var isSelected: Bool
    
    public init(number: String, isAvailable: Bool = true, isSelected: Bool = false) {
        self.number = number
        self.isAvailable = isAvailable
        self.isSelected = isSelected
    }
}
