import Foundation

class Author : Codable{
    var name: String
    var email: String
    
    init(){
        name = "Batman";
        email = "bruce@wayne.com"
    }
}
