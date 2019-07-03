import SwiftUI
import Combine


class Agent: BindableObject, Codable {
    var didChange = PassthroughSubject<Void, Never>()
    
    var id        = 1
    var token     = "agent-token"
    var name      = ""
    var email     = ""
    
    enum CodingKeys: String, CodingKey {
        case token, name, email
    }
    
    var tickets: [Ticket]?
    
    init(){
        
    }
    
    func fetchTickets(){
        Api().getTickets() { [weak self] tickets in
            guard tickets != nil else { return }
            
            self?.tickets = tickets
            DispatchQueue.main.async {
                self?.didChange.send(())
            }
        }
    }
    
    class func login(_ email:String, password: String, completion:@escaping(_ agent:Agent?)->Void) {
        Api.login(email, password: password) { agent in
            guard agent != nil else { return completion(nil) }
            
            UserDefaults.standard.set(email, forKey: "email")
            UserDefaults.standard.set(password, forKey: "password")
            Api.token = agent!.token
            
            completion(agent)
        }
    }
    
    class func doSavedLogin(_ completion:@escaping(_ agent:Agent?)->Void) {
        guard let email = UserDefaults.standard.string(forKey: "email"),
              let password = UserDefaults.standard.string(forKey: "password") else {
                return completion(nil)
        }
        
        self.login(email, password: password, completion: completion)
        
    }
    
}
