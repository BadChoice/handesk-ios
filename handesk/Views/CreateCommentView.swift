import SwiftUI

struct CreateCommentView : View {
    
    let ticket: Ticket
    
    @State private var newComment: String = "";
    @State private var isPrivate: Bool = false
    @State private var saving:Bool = false
    
    @Environment(\.isPresented) private var isPresented
    
    var body: some View {
        VStack(alignment: .leading) {
            TicketHeader(ticket: self.ticket)
            Divider()
            Toggle(isOn: $isPrivate) {
                Text("Private")
            }
            TextField("Write your comment...", text: $newComment)
                .frame(height:150).multilineTextAlignment(.leading)
            
            Button(action: {
                self.saving.toggle()
                self.ticket.postComment(body: self.newComment, isPrivate: self.isPrivate){success in
                    self.isPresented?.value = false
                    self.saving.toggle()
                }
            }, label: {
                if saving {
                    ActivityIndicator(isAnimating: .constant(true), style: .medium)
                }
                Text("Comment").color(Color.white).padding().background(Color("Brand")).cornerRadius(10)
            })
            Spacer()
        }.padding()
        .navigationBarTitle("New Comment")
        
        
    }
}

struct ActivityIndicator: UIViewRepresentable {
    
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

#if DEBUG
struct CreateCommentView_Previews : PreviewProvider {
    static var previews: some View {
        CreateCommentView(ticket:Ticket())
    }
}
#endif
