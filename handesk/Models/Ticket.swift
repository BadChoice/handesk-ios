import Foundation
import SwiftUI
import Combine

class Ticket: Codable, Identifiable, BindableObject{
    
    var didChange = PassthroughSubject<Void, Never>()
    
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
    
    var commentsWithBody : [TicketComment] {
        guard let theComments:[TicketComment] = comments else { return [] }
        return theComments + [TicketComment(ticket:self)]
    }
    
    var issueUrl:String?;
    
    enum CodingKeys: String, CodingKey {
        case id, title, body, requester_id, user_id, status, priority, ticket_type_id, requester, comments, created_at, updated_at
    }
    
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
    
    func fetchComments(){
        Api().getTicketComments(self.id) { [weak self] comments in
            self?.comments = comments;
            DispatchQueue.main.async {
                self?.didChange.send(())
            }
        }
    }
    
    func postComment(body:String, isPrivate:Bool, completion:@escaping (_ success:Bool) -> Void){
        guard !body.isEmpty else { return completion(false) }
        
        Api().postComment(self.id,  body: body, isPrivate:isPrivate) { [weak self] commentId in
            self?.addComment(TicketComment(ticket: self!, body: body, isPrivate: isPrivate))
            completion(commentId != nil)
        }
    }
    
    func addComment(_ comment:TicketComment) {
        self.comments = [comment] + self.comments!
        
        DispatchQueue.main.async {
            self.didChange.send(())
        }
    }
    
}
