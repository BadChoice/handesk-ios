import SwiftUI

struct TicketDetail : View {
    let ticket:Ticket;
    
    var body: some View {
        VStack{
            HStack{
                Text("#" + "\(ticket.id)")
                Text(ticket.requester?.name ?? "Unkwown")
                Spacer()
                StatusView(status: ticket.status, showFull: true)
                PriorityView(priority: ticket.priority, showFull:true)
            }
            HStack{
                Text(ticket.title).bold()
                Spacer()
            }
            Text(ticket.body).font(.body).color(Color.gray)
            List(ticket.comments ?? []) { comment in
                CommentView(comment: comment)
            }.edgesIgnoringSafeArea(.all)
        }.padding()
    }
}

#if DEBUG
struct TicketDetail_Previews : PreviewProvider {
    
    static var previews: some View {
        let tickets = Ticket.parse(jsonFile: "Tickets")
        return TicketDetail(ticket:tickets![0])
    }
}
#endif
