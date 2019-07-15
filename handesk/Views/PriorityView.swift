import SwiftUI

struct PriorityView : View {
    let priority: Priority
    let size :Int;
    
    var desiredWidth: Length {
        if (size == 0) { return 15 }
        if (size == 1) { return 20 }
        return 60
    }
    
    var desiredHeight: Length {
        if (size == 0) { return 15 }
        return 20
    }
    
    var font: Font{
        if (size == 0) { return .footnote }
        return .caption
    }
    
    init(priority:Priority){
        self.priority = priority;
        self.size = 1;
    }
    
    init(priority:Priority, size:Int){
        self.priority = priority;
        self.size = size;
    }
    
    var body: some View {
        HStack{
            Text(priority.name().prefix(size == 2 ? 10 : 1).uppercased())
                .font(font)
            }
            .frame(width: desiredWidth, height:desiredHeight)
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
