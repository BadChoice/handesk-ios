import SwiftUI

struct CreateCommentView : View {
    
    let ticket: Ticket
    
    @State private var newComment: String = "";
    @State private var isPrivate: Bool = false
    @State private var saving:Bool = false
    
    @Environment(\.isPresented) private var isPresented
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("New Comment")
            Toggle(isOn: $isPrivate) {
                Text("Private")
            }
            TextField("Write your comment...", text: $newComment)
            
            Button(action: {
                self.saving.toggle()
                self.ticket.postComment(body: self.newComment, isPrivate: self.isPrivate){success in
                    self.isPresented?.value = false
                    self.saving.toggle()
                }
            }, label: {            Text("Comment").color(Color.white).padding().background(Color("Brand")).cornerRadius(10)
            })
            
            if saving {
                Text("Saving...")
            }
        }.padding()
    }
}

#if DEBUG
struct CreateCommentView_Previews : PreviewProvider {
    static var previews: some View {
        CreateCommentView(ticket:Ticket())
    }
}
#endif
