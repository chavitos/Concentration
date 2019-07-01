//
//  Game.swift
//  Concentration
//
//  Created by Tiago Chaves on 27/06/19.
//  Copyright © 2019 Chaves. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    var indexOfFirstFaceUpCard: Int?
    
    init(numberOfPairOfCards:Int) {
        
        for _ in 0..<numberOfPairOfCards {
            
            let card = Card()
            cards += [card, card]
        }
        
        self.cards.shuffle()
    }
    
    func chooseCard(at index:Int) {
        
        if !cards[index].isMatched {
            
            if let indexOfFirstCard = indexOfFirstFaceUpCard, indexOfFirstCard != index {
                
                if cards[index].identifier == cards[indexOfFirstCard].identifier {
                    
                    cards[index].isMatched = true
                    cards[indexOfFirstCard].isMatched = true
                }
                
                cards[index].isFaceUp = true
                indexOfFirstFaceUpCard = nil
            }else{
                
                for faceDownIndex in cards.indices {
                    
                    cards[faceDownIndex].isFaceUp = false
                }
                
                indexOfFirstFaceUpCard = index
                cards[index].isFaceUp = true
            }
        }
    }
}
