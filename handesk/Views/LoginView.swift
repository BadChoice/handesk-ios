import SwiftUI

struct LoginView : View {
    @State var email:String     = ""
    @State var password:String  = ""
    
    @State var isLoggedIn = false;
    @State var agent:Agent?
    
    var body: some View {
        VStack {
            Image("Logo").resizable().aspectRatio(contentMode: .fit)
            Spacer()
            HStack{
                Text("Email")
                TextField("Email", text: $email)
            }
            HStack{
                Text("Password")
                SecureField("Password", text: $password)
            }
            Button(action: {
                self.doLogin()
            }) {
                Text("Login")
            }.padding(.horizontal, 10.0).padding(.vertical, 5.0)
                .background(Color("Brand")).accentColor(Color.white).cornerRadius(10)
        }.padding()
        .sheet(isPresented: $isLoggedIn, content: {
            ContentView(agent: self.agent!)
            
        })


    }
    
    func doLogin(){
        Agent.login(email, password: password) { agent in
            guard (agent != nil) else { return }
            self.agent = agent;
            agent?.fetchTickets()
            self.isLoggedIn = true;
        }
    }
}

#if DEBUG
struct LoginView_Previews : PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
#endif
