import SwiftUI

struct CreateCommentView : View {
    
    let ticket: Ticket
    
    var body: some View {
        Text("Creating comment")
    }
}

#if DEBUG
struct CreateCommentView_Previews : PreviewProvider {
    static var previews: some View {
        CreateCommentView(ticket:Ticket())
    }
}
#endif
