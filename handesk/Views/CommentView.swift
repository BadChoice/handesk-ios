import SwiftUI

struct CommentView : View {
    let comment:TicketComment
    var body: some View {
        VStack{
            HStack{
                Text(comment.author)
                Spacer()
                Text(comment.created_at).font(.caption).color(Color.gray)
            }
            Text(comment.body).font(.body)
        }
        .padding()
    }
}

#if DEBUG
struct CommentView_Previews : PreviewProvider {
    static var previews: some View {
        CommentView(comment: TicketComment())
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
#endif
