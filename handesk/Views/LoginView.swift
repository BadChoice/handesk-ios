import SwiftUI

struct LoginView : View {
    @State var email:String     = ""
    @State var password:String  = ""
    
    var body: some View {
        VStack {
            HStack{
                Text("Email")
                TextField($email)
            }
            HStack{
                Text("Password")
                SecureField($password)
            }
            Button(action: {}) {
                Text("Login")
            }
        }.padding()
    }
}

#if DEBUG
struct LoginView_Previews : PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
#endif
