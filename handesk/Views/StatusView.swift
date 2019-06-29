import SwiftUI

struct StatusView : View {
    let status: Status
    
    var body: some View {
        HStack{
            Text(status.name().prefix(1).uppercased())
            .font(.caption)
        }
        .frame(width: 20, height:20)
        .background(status.color())
        .cornerRadius(10)
        
    }
}

#if DEBUG
struct StatusView_Previews : PreviewProvider {
    static var previews: some View {
        Group{
            StatusView(status: .new)
            StatusView(status: .open)
            StatusView(status: .solved)
        }.previewLayout(.fixed(width: 30, height: 30))
    }
}
#endif
