import SwiftUI
import Combine

struct ContentView : View {
    
    @ObjectBinding var agent = Agent()
    
    init(agent:Agent){
        self.agent = agent;
    }
    
    var body: some View {
        NavigationView{
            TabbedView{
                TicketsList(tickets: agent.tickets ?? []).tabItem({
                    Image(systemName: "tray.full.fill")
                    Text("All")
                }).tag(0)
                TicketsList(tickets: agent.myTickets ?? []).tabItem({
                    Image(systemName: "person.fill")
                    Text("Mine")
                }).tag(1)
                TicketsList(tickets: agent.ticketsEscalated ?? []).tabItem({
                    Image(systemName: "flame.fill")
                    Text("Escalated")
                }).tag(2)
                TicketsList(tickets: agent.unassignedTickets ?? []).tabItem({
                    Image(systemName: "exclamationmark.triangle.fill")
                    Text("Unassigned")
                }).tag(3)
            }
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
