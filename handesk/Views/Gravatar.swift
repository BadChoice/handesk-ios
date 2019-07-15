import SwiftUI

struct Gravatar : View {
    
    @State private var uiImage: UIImage? = nil;
    let placeholderImage = UIImage(named:"Avatar")!
    
    let email:String?;
    
    var body: some View {
        Image(uiImage : uiImage ?? placeholderImage)
            .resizable()
            .clipShape(Circle())
            .aspectRatio(contentMode: .fit)
            .frame(width: 30, height:30)
            .onAppear {
                self.email?.gravatar { self.uiImage = $0 }
                
            }
    }
}

#if DEBUG
struct Gravatar_Previews : PreviewProvider {
    static var previews: some View {
        Gravatar(email: "jordi@gloobus.net")
    }
}
#endif
