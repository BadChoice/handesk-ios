import SwiftUI

struct StatusView : View {
    let status: Status
    let showFull :Bool;
    
    init(status:Status){
        self.status = status;
        self.showFull = false;
    }
    
    init(status:Status, showFull:Bool){
        self.status = status;
        self.showFull = showFull;
    }
    
    var body: some View {
        HStack{
            Text(status.name().prefix(showFull ? 10 : 1).uppercased())
            .font(.caption)
            .frame(width: showFull ? 60 : 20, height:20)
            .background(status.color())
            .cornerRadius(10)
        }
    }
}

#if DEBUG
struct StatusView_Previews : PreviewProvider {
    static var previews: some View {
        Group{
            StatusView(status: .new, showFull: true)
            StatusView(status: .open)
            StatusView(status: .solved)
        }.previewLayout(.fixed(width: 80, height: 30))
    }
}
#endif
