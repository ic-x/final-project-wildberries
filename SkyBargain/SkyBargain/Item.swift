//
//  Item.swift
//  SkyBargain
//
//  Created by Louise Hogan on 8/14/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
