import Foundation

let jsonstr = """
{
  "userId": 1,
  "id": 1,
  "title": "delectus aut autem",
  "completed": false
}
"""

// JSONSerialization
if let jsonData = jsonstr.data(using: .utf8), let jsonObject = try? JSONSerialization.jsonObject(with: jsonData, options: []) {
    print(jsonObject)
    if let datas = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]) {
        print(datas.count)
    }
    if let jsonDict = jsonObject as? [String: Any], let title = jsonDict["title"] as? String {
        print(title)
    }
}

// JSONEncoder & JSONDecoder
struct User: Codable {
    let id: Int
    let title: String
}
if let jsonData = jsonstr.data(using: .utf8), let user = try? JSONDecoder().decode(User.self, from: jsonData) {
    print(user)
    if let userData = try? JSONEncoder().encode(user) {
        print(userData.count)
    }
}
