//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Alex Ochigov on 8/8/20.
//  Copyright © 2020 Alex Ochigov. All rights reserved.
//

typealias Card = MemoryGame<String>.Card

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    var cards: Array<Card> {
        model.cards
    }
    
    func choosen(card: Card) {
 
        model.choose(card: card)
    }
}
