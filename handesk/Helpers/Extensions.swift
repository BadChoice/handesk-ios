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
