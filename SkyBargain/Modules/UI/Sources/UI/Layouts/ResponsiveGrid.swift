//
//  ResponsiveGrid.swift
//
//

import SwiftUI

public struct ResponsiveGrid<Content: View>: View {
    let items: [Content]
    let columns: Int
    
    public init(items: [Content], columns: Int = 2) {
        self.items = items
        self.columns = columns
    }
    
    public var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: columns)) {
            ForEach(0..<items.count, id: \.self) { index in
                items[index]
            }
        }
    }
}
