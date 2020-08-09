//
//  Cardify.swift
//  Memorize
//
//  Created by Alex Ochigov on 8/9/20.
//  Copyright © 2020 Alex Ochigov. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadium).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadium).stroke(lineWidth: edgeLineWidth)
                content
            } else {
                RoundedRectangle(cornerRadius: cornerRadium).fill()
            }
        }
    }
    
    // MARK: - Drawing Constants
    private let cornerRadium: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
}


extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
