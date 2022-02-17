//
//  ViewController.swift
//  gameRPS
//
//  Created by Илья Шаповалов on 16.02.2022.
//

import UIKit

class ViewController: UIViewController {
 
//Create the following outlets for updating the screen during play
    @IBOutlet var colorView: UIView!
    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var buttonRock: UIButton!
    @IBOutlet weak var buttonPaper: UIButton!
    @IBOutlet weak var buttonScissors: UIButton!
    @IBOutlet weak var buttonPlayAgain: UIButton!
    
    
    func updateGame(_ gameState:GameState) {
        switch gameState {
        case .start:
            gameStatus.text = gameState.label
            colorView.backgroundColor = gameState.backgroundColor
            appSign.text = "🤖"
            buttonPlayAgain.isHidden = true
            buttonRock.isEnabled = true
            buttonRock.isHidden = false
            buttonPaper.isEnabled = true
            buttonPaper.isHidden = false
            buttonScissors.isEnabled = true
            buttonScissors.isHidden = false
        case .win:
            gameStatus.text = gameState.label
            colorView.backgroundColor = gameState.backgroundColor
        case .lose:
            gameStatus.text = gameState.label
            colorView.backgroundColor = gameState.backgroundColor
        case .draw:
            gameStatus.text = gameState.label
            colorView.backgroundColor = gameState.backgroundColor
        }
    }
    
    func play(_ sign: Sign) {
        
        let oponentSign = randomSign()
        appSign.text = oponentSign.emoji
        updateGame(sign.compare(to: oponentSign))
        
        switch sign {
        case .rock:
            buttonPaper.isHidden = true
            buttonPaper.isEnabled = false
            buttonScissors.isHidden = true
            buttonScissors.isEnabled = false
            buttonPlayAgain.isHidden = false
            buttonPlayAgain.isEnabled = true
        case .paper:
            buttonRock.isHidden = true
            buttonRock.isEnabled = false
            buttonScissors.isHidden = true
            buttonScissors.isEnabled = false
            buttonPlayAgain.isHidden = false
            buttonPlayAgain.isEnabled = true
        case .scissors:
            buttonRock.isHidden = true
            buttonRock.isEnabled = false
            buttonPaper.isHidden = true
            buttonPaper.isEnabled = false
            buttonPlayAgain.isHidden = false
            buttonPlayAgain.isEnabled = true
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateGame(.start)
    }
    
//Create actions to handle the button taps
    @IBAction func actionRock(_ sender: Any) {
        play(.rock)
    }
    
    @IBAction func actionPaper(_ sender: Any) {
        play(.paper)
    }
    
    @IBAction func actionScissors(_ sender: Any) {
        play(.scissors)
    }
    
    @IBAction func actionPlayAgain(_ sender: Any) {
        updateGame(.start)
    }
    
}

