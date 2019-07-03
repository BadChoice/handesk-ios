import Foundation
import SwiftHTTP

struct ApiResponse: Codable{
    let data : [Ticket]
}

class Api{
    
    static let URL      = "http://handesk.test/api/agent/"
    let token: String;

    init(_ token:String){
        self.token = token;
    }
    
    func getTickets(_ completion:@escaping(_ tickets:[Ticket]) -> Void){
        HTTP.GET(Api.URL + "tickets" , parameters: nil, headers: self.authHeaders()){ response in
            let jsonString = String(data: response.data, encoding: .utf8)
            debugPrint(jsonString!)
            
            do{
                let apiResponse = try JSONDecoder().decode(ApiResponse.self, from: response.data)
                completion(apiResponse.data)
            }catch {
                print(error)
            }
        }
    }
    
    func authHeaders() -> [String: String]{
        return ["token" : self.token]
    }
    
}
