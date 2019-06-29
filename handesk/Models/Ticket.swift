import Foundation
import SwiftUI


class Ticket: Codable, Identifiable{
    let id: Int
    var title: String
    let body: String
    var requester_id: Int
    var user_id: Int?
    var status: Status
    var priority: Priority
    var ticket_type_id: Int?
    var requester: Requester?
    
    var comments: [TicketComment]?
    
    var issueUrl:String?;
    
    
    //https://benscheirman.com/2017/06/swift-json/    
    let created_at: String //Use date
    var updated_at: String //Use date
    
    
    init(){
        id              = 1
        title           = "An Awesome app"
        body            = "The super body"
        requester_id    = 1
        status          = .new
        priority        = .low
        created_at      = "2019-08-08 12:55:55"
        updated_at      = "2019-08-08 12:55:55"
        requester       = Requester()
    }
}
