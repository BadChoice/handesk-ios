import SwiftUI

struct Gravatar : View {
    
    @State private var uiImage: UIImage? = nil;
    let placeholderImage = UIImage(named:"Avatar")!
    
    let email:String;
    
    var body: some View {
        Image(uiImage : uiImage ?? placeholderImage)
            .resizable()
            .clipShape(Circle())
            .aspectRatio(contentMode: .fit)
            .frame(width: 30, height:30)
            .onAppear(perform: download)
    }
    
    func download() {
        let defaultImage = "https://raw.githubusercontent.com/BadChoice/handesk/master/public/images/default-avatar.png"
        let email = self.email.md5();
        var gravatarURL = "https://www.gravatar.com/avatar/";
        gravatarURL = gravatarURL +  email + "?s=50&d=" + defaultImage;
        
        guard let url = URL(string: gravatarURL) else {
            debugPrint("Invalid url")
            return;
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                self.uiImage = image
            } else {
                debugPrint("Error :\(String(describing:error))")
            }
        }.resume()
    }
}

#if DEBUG
struct Gravatar_Previews : PreviewProvider {
    static var previews: some View {
        Gravatar(email: "jordi@gloobus.net")
    }
}
#endif
