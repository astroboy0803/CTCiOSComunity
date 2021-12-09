import Foundation

public func runDictionary() {
    let dict0 = Dictionary<String, Int>()
    let dict1: Dictionary<String, Int> = .init()
    let dict2: Dictionary<String, Int> = [:]
    let dict3 = [String: Int]()
    let dict4: [String: Int] = .init()
    let dict5: [String: Int] = [:]

    // Access and Replace
    var lDict: [String: Int] = ["Two": 20, "Three": 2]
    lDict["One"] = 1
    print(lDict)
    if let numOne = lDict["One"] {
        print(numOne)
    }
    lDict["Three"] = 3
    print(lDict)
    lDict.updateValue(2, forKey: "Two")
    print(lDict)

    // Add and Remove
    lDict["Four"] = 4
    print(lDict)
    if let four = lDict.removeValue(forKey: "Four") {
        print(four)
    }
    print(lDict)
    lDict.removeAll()
    print(lDict)

    // methods
    let mDict: [String: Int] = ["One": 1, "Two": 2, "Three": 3]
    print(mDict.count)
    print(mDict.isEmpty)
    print(mDict.keys)
    print(mDict.values)
    
    // Iterating
    for row in mDict {
        print(row.key)
        print(row.value)
    }
}
