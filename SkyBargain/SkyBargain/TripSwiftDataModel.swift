//
//  TripSwiftDataModel.swift
//  SkyBargain
//

import Foundation
import SwiftData

@Model
final class TripSwiftDataModel {
    var timestamp: Date
    var liked: Bool
    
    init(timestamp: Date, liked: Bool) {
        self.timestamp = timestamp
        self.liked = liked
    }
}
