import Foundation

class Author : Codable{
    var name: String
    var email: String
    
    init(){
        name = "Batman";
        email = "bruce@wayne.com"
    }
    
    convenience init(name:String, email:String){
        self.init()
        self.name = name;
        self.email = email;
    }
}
