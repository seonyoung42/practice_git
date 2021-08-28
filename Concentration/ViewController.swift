//
//  ViewController.swift
//  Concentration
//
//  Created by 장선영 on 2020/09/30.
//

import UIKit

class ViewController: UIViewController {
    
    // branch 왤케 어렵냐고;;ㅡㅡㅡㅡㅡㅡ
   
    lazy var game = Concentration (numberOfPairsOfCards : (cardButtons.count + 1) / 2 )
    
    var flipCount = 0 { didSet { flipCountLabel.text = "Flips: \(flipCount)"} }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard (at: cardNumber)
            updateViewFromModel()
        }
        else {
            print("chosen card was not in cardButtons")
        }
        
    }
        
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for:UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ?  #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                
            }
            
        }
              
    }
    
    var emojiChoices = ["👻", "🎃", "❤️", "🥳", "👿", "☠️", "🖕🏻", "👮🏻‍♂️", "👩🏻‍💻"]
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
//        if emoji[card.identifier] != nil {
//            return emoji[card.identifier]!
//        } else {
//            return "?"
//        }
        return emoji[card.identifier] ?? "?"
    }
        
    
    
//    func flipCard(_ emoji : String, on button : UIButton) {
//        if button.currentTitle == emoji {
//            button.setTitle("", for: UIControl.State.normal)
//            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
//
//        }
//
//        else {
//            button.setTitle(emoji, for:UIControl.State.normal)
//            button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
//
//        }
//    }
}


