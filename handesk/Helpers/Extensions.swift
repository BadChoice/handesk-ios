import Foundation

extension Ticket {
    static func parse(jsonFile: String) -> [Ticket]? {
        guard let url = Bundle.main.url(forResource: jsonFile, withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let output = try? JSONDecoder().decode([Ticket].self, from: data)
            else {
                return nil
        }
        
        return output
    }
}
