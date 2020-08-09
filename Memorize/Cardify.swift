//
//  Cardify.swift
//  Memorize
//
//  Created by Alex Ochigov on 8/9/20.
//  Copyright © 2020 Alex Ochigov. All rights reserved.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    var rotation: Double
    var isFaceUp: Bool {
        rotation < 90
    }
    var animatableData: Double {
        get { return rotation }
        set { rotation = newValue }
    }
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: cornerRadium).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadium).stroke(lineWidth: edgeLineWidth)
                content

            }
                .opacity(isFaceUp ? 1 : 0)
             RoundedRectangle(cornerRadius: cornerRadium).fill()
                .opacity(isFaceUp ? 0 : 1)
        }
            .rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))

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
