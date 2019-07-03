import SwiftUI

struct CommentView : View {
    let comment:TicketComment
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image("Avatar").resizable().aspectRatio(contentMode: .fit)
                Text(comment.author.name).font(.subheadline)
                Spacer()
                Text(comment.created_at).font(.caption).color(Color.gray)
            }
            Text(comment.body).font(.body).lineLimit(nil)
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
