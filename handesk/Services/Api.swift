import Foundation
import SwiftHTTP

struct ApiResponse: Codable{
    let data : [Ticket]
}

struct LoginResponse: Codable{
    let data : Agent
}


struct CommentsResponse: Codable{
    let data : [TicketComment]
}

struct IdResponse: Codable{
    let data : [String: Int]
}



class Api{
    
    static let URL      = "http://handesk.test/api/agent/"
    static var token: String = "";
    
    class func login(_ email:String, password: String, completion:@escaping(_ agent:Agent?)->Void) {
        HTTP.POST(Api.URL + "login", parameters: ["email" : email, "password" : password]){ response in
            let jsonString = String(data: response.data, encoding: .utf8)
            debugPrint(jsonString!)
            
            do{
                let apiResponse = try JSONDecoder().decode(LoginResponse.self, from: response.data)
                completion(apiResponse.data)
            }catch {
                print(error)
                completion(nil)
            }
        }
    }
    
    func getTickets(_ completion:@escaping(_ tickets:[Ticket]?) -> Void){
        HTTP.GET(Api.URL + "tickets" , parameters: nil, headers: self.authHeaders()){ response in
            let jsonString = String(data: response.data, encoding: .utf8)
            debugPrint(jsonString!)
            
            do{
                let apiResponse = try JSONDecoder().decode(ApiResponse.self, from: response.data)
                completion(apiResponse.data.sorted{ $0.updated_at > $1.updated_at })
            }catch {
                print(error)
                completion(nil)
            }
        }
    }
    
    func getTicketComments(_ ticketId: Int, _ completion:@escaping(_ comments:[TicketComment]?) -> Void){
        HTTP.GET(Api.URL + "tickets/" + String(ticketId) + "/comments" , parameters: nil, headers: self.authHeaders()){ response in
            let jsonString = String(data: response.data, encoding: .utf8)
            debugPrint(jsonString!)
            
            do{
                let apiResponse = try JSONDecoder().decode(CommentsResponse.self, from: response.data)
                completion(apiResponse.data.sorted { $0.created_at > $1.created_at })
                
            }catch {
                print(error)
                completion(nil)
            }
        }
    }
    
    func postComment(_ ticketId: Int, body:String, isPrivate:Bool, _ completion:@escaping(_ commentId:Int?) -> Void){
        HTTP.POST(Api.URL + "tickets/" + String(ticketId) + "/comments" , parameters: ["body" : body, "private": isPrivate], headers: self.authHeaders()){ response in
            let jsonString = String(data: response.data, encoding: .utf8)
            debugPrint(jsonString!)
            
            do{
                let apiResponse = try JSONDecoder().decode(IdResponse.self, from: response.data)
                completion(apiResponse.data["id"])
            }catch {
                print(error)
                completion(nil)
            }
        }
    }
    

    
    
    func authHeaders() -> [String: String]{
        return ["token" : Api.token]
    }
    
}
