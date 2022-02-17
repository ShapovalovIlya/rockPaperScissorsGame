//
//  Sign.swift
//  gameRPS
//
//  Created by Илья Шаповалов on 16.02.2022.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

//function gets a random number, then uses it to create a new Sign instance
func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock
    case paper
    case scissors
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "🤚"
        case .scissors:
            return "✌️"
        }
    }
    
    //The method should return a GameState based on a comparison between self and the opponent’s turn
    func compare(to opponent: Sign) -> GameState {
        if self == opponent.self {
            return .draw
        } else {
            switch self {
            case .scissors:
                if opponent == .paper {
                    return .win
                } else {
                    return .lose
                }
            case .paper:
                if opponent == .scissors {
                    return .lose
                } else {
                    return .win
                }
            case .rock:
                if opponent == .scissors {
                    return .win
                } else {
                    return .lose
                }
            }
        }
    }
    
}
