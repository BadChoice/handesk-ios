import SwiftUI

struct CreateCommentView : View {
    
    let ticket: Ticket
    @State private var newComment: String = "Write here the new comment";
    
    var body: some View {
        Text("Creating comment")
//        TextField(newComment)
        
    }
}

#if DEBUG
struct CreateCommentView_Previews : PreviewProvider {
    static var previews: some View {
        CreateCommentView(ticket:Ticket())
    }
}
#endif
