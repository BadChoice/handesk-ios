import SwiftUI

enum Status : Int, CaseIterable, Codable {
    case new     = 1;
    case open    = 2;
    case pending = 3;
    case solved  = 4;
    case closed  = 5;
    case merged  = 6;
    case spam    = 7;
    
    func color() -> Color {
        switch(self) {
            case .new       : return Color.red;
            case .open      : return Color.orange;
            case .pending   : return Color.blue;
            case .solved    : return Color.green;
            case .closed    : return Color.black;
            default         : return Color.gray;
        }
    }
    
    func name() -> String{
        return "\(self)"
    }
}

enum Priority : Int, Codable{
    case low       = 1;
    case normal    = 2;
    case high      = 3;
    case blocker   = 4;
    
    func color() -> Color{
        switch(self) {
            case .low :     return Color.yellow;
            case .normal :  return Color.green;
            case .high :    return Color.orange;
            case .blocker : return Color.red;
        }
    }
    
    func name() -> String{
        return "\(self)"
    }
}
