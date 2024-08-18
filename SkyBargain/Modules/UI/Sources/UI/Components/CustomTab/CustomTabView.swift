//
//  CustomTabView.swift
//

import SwiftUI

public struct CustomTabView: View {
    @Binding var selection: Int
    let tabItems: [CustomTabItem]
    
    public init(selection: Binding<Int>, tabItems: [CustomTabItem]) {
        self._selection = selection
        self.tabItems = tabItems
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            ZStack {
                ForEach(tabItems.indices, id: \.self) { index in
                    if selection == index {
                        tabItems[index].view
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
            }
            Spacer()
            HStack {
                ForEach(tabItems.indices, id: \.self) { index in
                    Button(action: {
                        withAnimation(.easeInOut) {
                            selection = index
                        }
                    }) {
                        tabIcon(for: index)
                            .frame(maxWidth: .infinity)
                            .scaleEffect(selection == index ? 1.35 : 1.0)
                            .animation(.easeInOut(duration: 0.3), value: selection)
                    }
                }
            }
            .padding()
        }
        .background(Color.brandBackground)
    }
    
    @ViewBuilder
    private func tabIcon(for index: Int) -> some View {
        let isActive = selection == index
        let icon = isActive ? tabItems[index].activeIcon : tabItems[index].icon
        
        icon
            .font(.system(size: 20))
            .foregroundColor(isActive ? .accentColor : .icon)
            .bold()
            .transition(.scale)
    }
}
