import SwiftUI

class TicketComment: Codable, Identifiable{
    
    let id: Int;
    var author:String
    var user_id:Int?
    var isPrivate:Bool = false;
    var created_at:String
    var body:String
    
    init(){
        id          = 1
        author      = "Peter Parker"
        created_at  = "2018-05-05 12:24:55"
        body        = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tristique justo dui, a tristique magna rutrum a. Phasellus et ligula ut nulla pellentesque tincidunt et at neque. Nullam porttitor ut purus ut tincidunt. Aenean purus sapien, ornare ac luctus ac, faucibus id eros. Ut eu est eu est sollicitudin fringilla. Sed et arcu quis ex interdum convallis euismod non lectus. Curabitur vel velit a lorem ornare venenatis in at turpis. Aenean placerat pulvinar lorem ac tristique. Vestibulum ultricies odio sem, et faucibus nisi bibendum at. Duis tortor est, ultrices ac sapien a, varius sagittis ex. Fusce vel placerat massa. Vestibulum viverra maximus sem, vel mattis mi vestibulum at."
    }
    
    convenience init(isPrivate:Bool){
        self.init()
        self.isPrivate = isPrivate        
    }
}
