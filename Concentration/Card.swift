//
//  Card.swift
//  Concentration
//
//  Created by Tiago Chaves on 27/06/19.
//  Copyright © 2019 Chaves. All rights reserved.
//

import Foundation

struct Card {
    
    var identifier: Int
    var isFaceUp = false
    var isMatched = false
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        
        identifierFactory += 1
        
        return identifierFactory
    }
    
    init() {
        
        identifier = Card.getUniqueIdentifier()
    }
}
