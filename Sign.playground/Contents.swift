import UIKit
import GameplayKit


 enum Sign {
    case piedra, papel, tijeras
    
    var descripcion: String {
        switch self {
        case .piedra:
            return "👊"
        case .tijeras:
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
            
            if computerSign == .papel {
                if self == .piedra {
                    result = .perder
                }
                else {
                    result = .ganar
                }
            }
            
            if computerSign == .piedra {
                if self == .papel {
                    result = .ganar
                }
                else {
                    result = .perder
                }
            }
            if computerSign == .tijeras{
                if self == .papel {
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

print
