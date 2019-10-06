//
//  GameSet.swift
//  RockScissorPaper
//
//  Created by Adriana Jauregui on 10/5/19.
//  Copyright © 2019 Adriana Jauregui. All rights reserved.
//

import UIKit
import GameplayKit

 enum Sign {
    case rock, paper, scissors
    
    var descripcion: String {
        switch self {
        case .rock:
            return "👊"
        case .scissors:
            return "✌️"
        default:
            return "🖐"
        }
    }
    
    func compare(singComputer: Sign) -> GameSet {
        
        var result = GameSet.inicio
        let computerSign = singComputer
        
        if self == singComputer {
            result = .empatar
        }
        else {
            
            if computerSign == .paper {
                if self == .rock {
                    result = .perder
                }
                else {
                    result = .ganar
                }
            }
            
            if computerSign == .rock {
                if self == .paper {
                    result = .ganar
                }
                else {
                    result = .perder
                }
            }
            if computerSign == .scissors{
                if self == .paper {
                    result = .perder
                }
                else {
                    result = .ganar
                }
            }
        }
        
        return result
    }
}

enum  GameSet: String{
    case inicio, ganar, perder, empatar
    
}
let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let newSign =  randomChoice.nextInt()
    switch newSign{
        case 0:
            return .rock
        case 1:
            return .paper
        default:
            return .scissors
       }
     
}


