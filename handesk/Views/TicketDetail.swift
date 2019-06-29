import SwiftUI

struct TicketDetail : View {
    let ticket:Ticket;
    
    var body: some View {
        VStack{
            HStack{
                Text("#" + "\(ticket.id)")
                Text(ticket.requester?.name ?? "Unkwown")
                Spacer()
                StatusView(status: ticket.status)
                PriorityView(priority: ticket.priority)
            }
            HStack{
                Text(ticket.title).bold()
                Spacer()
            }
            Text(ticket.body).font(.body).color(Color.gray)
            /*List(ticket.comments) { comment in
                CommentView(comment: comment)
            }*/
        }.padding()
    }
}

#if DEBUG
struct TicketDetail_Previews : PreviewProvider {
    static var previews: some View {
        TicketDetail(ticket:Ticket())
    }
}
#endif
