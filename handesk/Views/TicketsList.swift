import SwiftUI

struct TicketsList : View {
    var tickets:[Ticket]
    
    var body: some View {
        List(tickets) { ticket in
            NavigationButton(destination: TicketDetail(ticket: ticket)) {
                TicketRow(ticket: ticket)
            }
        }
    }
}

#if DEBUG
struct TicketsList_Previews : PreviewProvider {
    static var previews: some View {
        TicketsList(tickets:[Ticket(), Ticket(), Ticket()])
    }
}
#endif
