import SwiftUI

struct TicketDetail : View {
    @ObjectBinding var ticket:Ticket;
    @State private var composingComment = false;
    
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text("#" + "\(ticket.id)")
                    Text(ticket.requester?.name ?? "Unkwown")
                    Spacer()
                    StatusView(status: ticket.status, showFull: true)
                    PriorityView(priority: ticket.priority, showFull:true)
                }
                HStack{
                    Text(ticket.title).bold().lineLimit(nil)
                    Spacer()
                }
            }.padding(.horizontal)
            Divider()
            List(ticket.commentsWithBody) { comment in
                CommentView(comment: comment)
            }.padding(.horizontal, -12)
        }.padding(.top, 10)
        .onAppear {
            self.ticket.fetchComments()
        }
        .navigationBarTitle(Text("#" + "\(ticket.id)"), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.composingComment.toggle()
        }, label: {
            Image(systemName: "square.and.pencil")
        }))
        
        .presentation(self.composingComment ? Modal(CreateCommentView(self.ticket)) : nil)
        
        
    }
}

#if DEBUG
struct TicketDetail_Previews : PreviewProvider {
    
    static var previews: some View {
        let tickets = Ticket.parse(jsonFile: "Tickets")
        return NavigationView{
            TicketDetail(ticket:tickets![0])
        }
    }
}
#endif
