
import Foundation

class Requester : Codable {
    let id : Int
    var name : String
    var email : String?
    
    init(){
        id = 1;
        name = "Bruce wayne"
        email = "bruce@wayne.com"
    }
}
