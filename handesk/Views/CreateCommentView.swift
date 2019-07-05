import SwiftUI

struct CreateCommentView : View {
    
    let ticket: Ticket
    
    @State private var newComment: String = "Write here the new comment";
    
    @Environment(\.isPresented) private var isPresented
    
    var body: some View {
        VStack{
            Text("Creating comment")
            TextField($newComment)
            
            Button(action: {
                self.isPresented?.value = false
            }, label: {
                Text("Comment").color(Color.white).padding().background(Color("Brand")).cornerRadius(10)
            })
        }
    }
}

#if DEBUG
struct CreateCommentView_Previews : PreviewProvider {
    static var previews: some View {
        CreateCommentView(ticket:Ticket())
    }
}
#endif
