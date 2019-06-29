import SwiftUI

struct PriorityView : View {
    let priority: Priority
    
    var body: some View {
        HStack{
            Text(priority.name().prefix(1))
                .font(.caption)
            }
            .frame(width: 20, height:20)
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
