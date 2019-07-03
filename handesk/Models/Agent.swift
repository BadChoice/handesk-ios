import SwiftUI
import Combine


class Agent: BindableObject {
    var didChange = PassthroughSubject<Void, Never>()
    var token     = "agent-token"
    
    var tickets: [Ticket]?
    
    init(){
        self.fetchTickets()
    }
    
    func fetchTickets(){
        Api(self.token).getTickets() { [weak self] tickets in
            self?.tickets = tickets;
            DispatchQueue.main.async {
                self?.didChange.send(())
            }
        }
    }
    
}
