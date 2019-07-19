import SwiftUI

struct CommentView : View {
    let comment:TicketComment
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Gravatar(email: comment.author.email)
                Text(comment.author.name).foregroundColor(Color.gray).font(.subheadline)
                Spacer()
                Text(comment.created_at).font(.caption).foregroundColor(Color.gray)
            }
            Text(comment.body).font(.callout).lineLimit(nil)
        }.padding()
        .background(comment.isNote ? Color("Note") : Color.white)
        
    }
}

#if DEBUG
struct CommentView_Previews : PreviewProvider {
    static var previews: some View {
        Group{
            CommentView(comment: TicketComment())
            CommentView(comment: TicketComment(isPrivate:true))
        }.previewLayout(.fixed(width: 300, height: 70))
    }
}
#endif
