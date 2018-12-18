//
//  ViewController.swift
//  seventhProject
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 dw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var cardButtons: [UIButton]!
    lazy var game = Concentation(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    @IBOutlet weak var score: UILabel!
    var flipCount = 0 {
        didSet{
            score.text = "Score: \(game.score)"
        }
    }
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
        print("chosen card was not in cardButtons")
        }
    }
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for:card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            }
            else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
        score.text = "Score: \(game.score)"
    }
    var emojiChoices = ["🧞‍♀️","🧙‍♀️","🧞‍♂️","🧝‍♀️","🧜‍♀️","🧚‍♂️","🧚‍♀️","🧙‍♂️","🧜‍♂️","🧝‍♂️","🧛‍♀️","🧛‍♂️"]
    var emoji = [Int:String]()
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil,emojiChoices.count > 0{
            let randomInedx = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomInedx)
        }
        return emoji[card.identifier] ?? "?"
    }
    @IBAction func newGame(_ sender: Any) {
        game = Concentation(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        emojiChoices = ["🧞‍♀️","🧙‍♀️","🧞‍♂️","🧝‍♀️","🧜‍♀️","🧚‍♂️","🧚‍♀️","🧙‍♂️","🧜‍♂️","🧝‍♂️","🧛‍♀️","🧛‍♂️"]
        updateViewFromModel()
    }
   
}
    


