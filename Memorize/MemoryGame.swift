//
//  MemoryGame.swift
//  Memorize
//
//  Created by Alex Ochigov on 8/8/20.
//  Copyright © 2020 Alex Ochigov. All rights reserved.
//

import Foundation

struct MemoryGame<T> where T: Equatable {
    private(set) var cards: Array<Card>

    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potencialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potencialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potencialMatchIndex].isMatched = true
                }
                self.cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, contentFactory: (Int) -> T) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = contentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
    }
    
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: T
    }
}
