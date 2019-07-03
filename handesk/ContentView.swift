import SwiftUI
import Combine

struct ContentView : View {
    
    //@ObjectBinding var agent = Agent()
    var agent = Agent()
    
    let tickets: [Ticket];
    
    var body: some View {
        NavigationView{
            TicketsList(tickets: tickets)
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    
    static var previews: some View {
        
        let tickets = Ticket.parse(jsonFile: "Tickets")            
        
        return ForEach(["iPhone XS", "iPhone SE", "iPhone XS Max"].identified(by: \.self)) { deviceName in
            ContentView(
                tickets:/*[Ticket(), Ticket(), Ticket()]*/ tickets!
            )
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}
#endif
