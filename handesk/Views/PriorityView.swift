import SwiftUI

struct PriorityView : View {
    let priority: Priority
    let showFull :Bool;
    
    init(priority:Priority){
        self.priority = priority;
        self.showFull = false;
    }
    
    init(priority:Priority, showFull:Bool){
        self.priority = priority;
        self.showFull = showFull;
    }
    
    var body: some View {
        HStack{
            Text(priority.name().prefix(showFull ? 10 : 1).uppercased())
                .font(.caption)
            }
            .frame(width: showFull ? 60 : 20, height:20)
            .background(priority.color())
            .cornerRadius(10)
        
    }
}

#if DEBUG
struct PriorityView_Previews : PreviewProvider {
    static var previews: some View {
        PriorityView(priority: .normal)
    }
}
#endif
