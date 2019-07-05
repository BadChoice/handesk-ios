import SwiftUI
import Combine

struct ContentView : View {
    
    @ObjectBinding var agent = Agent()
    
    init(agent:Agent){
        self.agent = agent;
    }
    
    var body: some View {
        NavigationView{
            TicketsList(tickets: agent.tickets ?? [])
            .navigationBarTitle(Text("Tickets"))
        }
        
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    
    static var previews: some View {
        
        //let tickets = Ticket.parse(jsonFile: "Tickets")            

        return ForEach(["iPhone XS", "iPhone SE", "iPhone XS Max"].identified(by: \.self)) { deviceName in
            ContentView(
                agent : Agent()
            )
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}
#endif
