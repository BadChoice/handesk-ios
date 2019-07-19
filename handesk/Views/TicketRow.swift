import SwiftUI

struct TicketRow : View {
    let ticket:Ticket;
    
    var body: some View {
        
        HStack{
            VStack{
                StatusView(status: ticket.status, size:0).padding(.bottom, 0)
                PriorityView(priority: ticket.priority, size:0)
            }
            VStack{
                HStack {
                    Text(ticket.title).font(.subheadline).bold()
                    Spacer()
                    Text(ticket.updated_at).font(.caption).foregroundColor(Color.gray)
                }
                //Spacer()
                HStack{
                    Text(ticket.requester?.name ?? "Unknown").font(.footnote)
                    Spacer()
                    
                }
            }
        }
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
