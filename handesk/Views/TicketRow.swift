import SwiftUI

struct TicketRow : View {
    let ticket:Ticket;
    
    var body: some View {
        
        VStack{
            HStack {
                Text(ticket.title).font(.subheadline).bold()
                Spacer()
                StatusView(status: ticket.status)
                PriorityView(priority: ticket.priority)
            }
            Spacer()
            HStack{
                Text(ticket.requester?.name ?? "Unknown").font(.footnote)
                Spacer()
                Text(ticket.updated_at).font(.caption).color(Color.gray)
            }
        }.padding()
        
    }
}

#if DEBUG
struct TicketRow_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            TicketRow(ticket: Ticket())
            TicketRow(ticket: Ticket())
        }
        .previewLayout(.fixed(width: 360, height: 70))
    }
}
#endif
