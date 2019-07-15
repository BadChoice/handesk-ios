import Foundation
import CryptoKit

extension Ticket {
    static func parse(jsonFile: String) -> [Ticket]? {
        guard let url   = Bundle.main.url(forResource: jsonFile, withExtension: "json"),
            let data    = try? Data(contentsOf: url)
            else {
                return nil
        }
        do {
            let output = try JSONDecoder().decode([Ticket].self, from: data)
            return output
        }catch{
            print(error)
            return nil;
        }
        
    }
}

extension Date{
    func datetimeString() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd H:m:s"
        return formatter.string(from: self)
    }
}

/*extension Color{
    func luminance() -> CGFloat {
        //var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0 ;
        //self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        let luminance = (self.red / 255.0) * 0.3 + (self.green / 255.0) * 0.59 + (self.blue / 255.0) * 0.11;
        return luminance * 100;
    }
}*/




extension String {
    func md5() -> String {
        let digest = Insecure.MD5.hash(data: self.data(using: .utf8) ?? Data())
        
        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}
