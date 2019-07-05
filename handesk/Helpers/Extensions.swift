import Foundation

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
