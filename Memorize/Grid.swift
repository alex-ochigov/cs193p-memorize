//
//  Grid.swift
//  Memorize
//
//  Created by Alex Ochigov on 8/9/20.
//  Copyright © 2020 Alex Ochigov. All rights reserved.
//

import SwiftUI

struct Grid<T, K>: View where T: Identifiable, K: View {
    private var items: [T]
    private var viewForItem: (T) -> K
    
    init(_ items: [T], viewForItem: @escaping (T) -> K) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }
    
    private func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            self.body(for: item, in: layout)
        }
    }
    
    private func body(for item: T, in layout: GridLayout) -> some View {
        let index = items.firstIndex(matching: item)!
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
}


