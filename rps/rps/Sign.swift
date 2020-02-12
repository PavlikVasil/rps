//
//  Sign.swift
//  rps
//
//  Created by Павел on 10.02.2020.
//  Copyright © 2020 Павел. All rights reserved.
//

import Foundation

func randomSign() -> Sign {
    var number = Int.random(in: 0...2)
    if number == 0{
        return .scissors
    }else if number == 1{
        return .rock
    }else{
        return .paper
    }
}

enum Sign{
    case rock,paper,scissors
    
    var emoji: String{
        switch self{
        case .paper:
            return "👋"
        case .rock:
            return "👊"
        case .scissors:
            return "✌️"
        }
    }
    
    func comparison(_ opponent: Sign) -> GameState{
        switch (self, opponent){
        case (.paper, .rock),
             (.rock, .scissors),
             (.scissors, .paper):
            return .win
        case  (.paper, .paper),
              (.rock, .rock),
              (.scissors, .scissors):
            return .draw
        default:
            return .lose
        }
        
    }
}
