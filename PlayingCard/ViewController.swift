//
//  ViewController.swift
//  PlayingCard
//
//  Created by Crafter on 4/9/19.
//  Copyright © 2019 Crafter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var deck = PlayingCardDeck()
    
    @IBOutlet weak var playingCardView: PlayingCardView! {
        didSet {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.left, .right]
            playingCardView.addGestureRecognizer(swipe)
            let pinchSelector = #selector(playingCardView.adjustFaceCardScale(byHandlingGestureRecognizerBy:))
            let pinch = UIPinchGestureRecognizer(target: playingCardView, action: pinchSelector)
            playingCardView.addGestureRecognizer(pinch)
        }
    }
    
    
    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended:
            playingCardView.isFaceUp = !playingCardView.isFaceUp
        default:
            break
        }
        
    }
    
    
    @objc func nextCard() {
        if let card = deck.draw() {
         playingCardView.rank = card.rank.order
         playingCardView.suit = card.suit.rawValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        
    }
}

