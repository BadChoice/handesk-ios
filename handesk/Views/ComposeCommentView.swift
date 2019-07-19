import SwiftUI

struct ComposeCommentView : View {
    
    let ticket: Ticket
    
    @State private var newComment: String   = "";
    @State private var isPrivate: Bool      = false
    @State private var saving:Bool          = false
    @State private var newStatus:Status     = .pending;
    
     @Environment(\.isPresented) var isPresented: Binding<Bool>?
    
    var body: some View {
        VStack(alignment: .leading) {
            
            TicketHeader(ticket: self.ticket).padding()
            
            Form{
                Toggle(isOn: $isPrivate) {
                    Text("Private")
                }
                Picker(selection: $newStatus, label: Text("Status")) {
                    ForEach(Status.allCases, id:\.self) {
                        Text($0.name()).tag($0)
                    }
                }
                TextField("Write your comment...", text: $newComment)
                    .frame(height:150).multilineTextAlignment(.leading).lineLimit(nil)
                
                Section{
                    HStack{
                        Spacer()
                        Button(action: {
                            self.postComment()
                        }, label: {
                            if saving {
                                ActivityIndicator(isAnimating: .constant(true), style: .medium)
                            }
                        Text("Comment")
                            .foregroundColor(Color.white).padding()
                            .background(Color("Brand")).cornerRadius(10)
                        })
                        Spacer()
                    }
                }
            }

        }
        .navigationBarTitle("New Comment")
    }
    
    func postComment(){
        self.saving.toggle()
        self.ticket.postComment(body: self.newComment, isPrivate: self.isPrivate, newStatus: self.newStatus){success in
            self.isPresented?.value = false
            self.saving.toggle()
        }
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
        ComposeCommentView(ticket:Ticket())
    }
}
#endif
