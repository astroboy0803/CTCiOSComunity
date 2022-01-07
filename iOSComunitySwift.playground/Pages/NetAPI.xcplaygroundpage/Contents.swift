import Foundation
import PlaygroundSupport

// 讓PlaygroundPage不會中止
PlaygroundPage.current.needsIndefiniteExecution = true

struct User: Codable {
    
    struct Company: Codable {
        let name: String
        let catchPhrase: String
    }
    
    struct Address: Codable {
        let street: String
        let suite: String
        let city: String
        let zipcode: String
    }
    
    let id: Int
    let name: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
}

var components: URLComponents = .init()
// https://jsonplaceholder.typicode.com/users
components.scheme = "https"
components.host = "jsonplaceholder.typicode.com"
components.path = "/users"
// setup query
//components.queryItems = [.init(name: "", value: "")]

//URL(string: "https://jsonplaceholder.typicode.com/users")

guard let url = components.url else {
    fatalError("url is nil")
}
let request: URLRequest = .init(url: url)
URLSession.shared.dataTask(with: request) { data, resp, error in
    if let error = error {
        debugPrint(error)
        return
    }
    debugPrint(resp)
    guard let data = data else {
        return
    }
    print(String(data: data, encoding: .utf8))
    guard let user = try? JSONDecoder().decode([User].self, from: data) else {
        return
    }
    print(user)
}.resume()
