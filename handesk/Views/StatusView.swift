import SwiftUI

struct StatusView : View {
    let status: Status
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
    
    init(status:Status){
        self.status = status;
        self.size = 1;
    }
    
    init(status:Status, size:Int){
        self.status = status;
        self.size = size;
    }
    
    var body: some View {
        HStack{
            Text(status.name().prefix(size == 2 ? 10 : 1).uppercased())
            .font(font)
            .frame(width: desiredWidth, height:desiredHeight)
            .background(status.color())
            .cornerRadius(10)
        }
    }
}

#if DEBUG
struct StatusView_Previews : PreviewProvider {
    static var previews: some View {
        Group{
            StatusView(status: .new, size: 0)
            StatusView(status: .new, size: 1)
            StatusView(status: .new, size: 2)
            StatusView(status: .open)
            StatusView(status: .solved)
        }.previewLayout(.fixed(width: 80, height: 30))
    }
}
#endif
