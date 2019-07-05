import SwiftUI

class TicketComment: Codable, Identifiable{
    
    let id: Int;
    var user_id:Int?
    var author:Author
    var isPrivate:Int = 0;
    var created_at:String
    var body:String
    
    var isNote: Bool {
        return isPrivate == 1
    }
    
    private enum CodingKeys : String, CodingKey {
        case id, author, user_id, created_at, body, isPrivate = "private"
    }
    
    init(){
        id          = 1
        author      = Author()
        created_at  = "2018-05-05 12:24:55"
        body        = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tristique justo dui, a tristique magna rutrum a. Phasellus et ligula ut nulla pellentesque tincidunt et at neque. Nullam porttitor ut purus ut tincidunt. Aenean purus sapien, ornare ac luctus ac, faucibus id eros. Ut eu est eu est sollicitudin fringilla. Sed et arcu quis ex interdum convallis euismod non lectus. Curabitur vel velit a lorem ornare venenatis in at turpis. Aenean placerat pulvinar lorem ac tristique. Vestibulum ultricies odio sem, et faucibus nisi bibendum at. Duis tortor est, ultrices ac sapien a, varius sagittis ex. Fusce vel placerat massa. Vestibulum viverra maximus sem, vel mattis mi vestibulum at."
    }
    
    convenience init(isPrivate:Bool){
        self.init()
        self.isPrivate = isPrivate ? 1 : 0
    }
    
    convenience init(ticket:Ticket){
        self.init()
        self.author = Author(name: ticket.requester?.name ?? "unkown",
                             email:ticket.requester?.email ?? "unkdown@email.com")
        self.body = ticket.body;
        self.created_at = ticket.created_at;
    }
}
