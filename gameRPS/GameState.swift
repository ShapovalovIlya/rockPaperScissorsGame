//
//  GameState.swift
//  gameRPS
//
//  Created by Илья Шаповалов on 16.02.2022.
//

import Foundation
import UIKit

enum GameState {
    case start
    case win
    case lose
    case draw
    
//this method set different label depending of state of the game
    var label: String {
        switch self {
        case .start:
            return "Rock, Paper, Scissors?"
        case .win:
            return "You win!"
        case .lose:
            return "You loose!"
        case .draw:
            return "It's a draw!"
        }
    }

//this method set a different background color to the main view depending on the ​state
    var backgroundColor: UIColor {
        switch self {
        case .start:
            return .lightGray
        case .win:
            return .systemGreen
        case .lose:
            return .systemRed
        case .draw:
            return .lightGray
        }
    }
    
    
}
