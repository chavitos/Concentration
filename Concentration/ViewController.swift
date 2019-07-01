//
//  ViewController.swift
//  Concentration
//
//  Created by Tiago Chaves on 27/06/19.
//  Copyright © 2019 Chaves. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfPairOfCards: cardButtons.count / 2)
    var flipCount:Int = 0 {
        didSet {
            flipsLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipsLabel: UILabel!
    
    @IBAction func touchCard(_ sender:UIButton) {
        
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    @IBAction func newGame(_ sender: Any) {
        
        flipCount = 0
        game = Concentration(numberOfPairOfCards:  cardButtons.count / 2)
        emojiChoices = emojisCollection
        updateViewFromModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emojiChoices = emojisCollection
    }
    
    func updateViewFromModel() {
        
        for index in cardButtons.indices {
            
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emojis(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else{
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    let emojisCollection = ["🎃","🦇","😈","👻","😲","😇","🤪","🕷"]
    var emojiChoices:[String] = []
    var emoji = [Int:String]()
    
    func emojis(for card:Card) -> String {
        
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        return emoji[card.identifier] ?? "?"
    }
}

