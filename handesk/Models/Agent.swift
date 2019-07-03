import Combine

class Agent/*: BindableObject */{
    //var didChange = PassthroughSubject<Void, Never>()
    
    var tickets: [Ticket]?
    
    init(){
        self.fetchTickets()
    }
    
    func fetchTickets(){
        Api.getTickets() { tickets in
            self.tickets = tickets;
        }
    }
    
}
