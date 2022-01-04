//: [Previous](@previous)

import Foundation

// protocol conform protocol
protocol Name {
    var firstName: String { get set }
    var lastName: String { get set }
}

protocol Age {
    var age: Double { get set }
}

protocol Fur {
    var furColor: String { get set }
}

protocol Hair {
    var hairColor: String { get set }
}

protocol Person: Name, Age, Fur, Hair {
    var height: Double { get set }
}

protocol Dog: Name, Age, Fur {
    var breed: String { get set }
}

// protocol-composition
protocol Occupation {
    var occupationName: String { get set }
    var yearSalary: Double { get set }
    var experienceYears: Double { get set }
}

struct Programmer: Person, Occupation {
    var firstName: String
    var lastName: String
    var age: Double
    var furColor: String
    var hairColor: String
    var height: Double
    var occupationName: String
    var yearSalary: Double
    var experienceYears: Double
}

protocol PersonProtocol {
    var firstName: String { get set }
    var lastName: String { get set }
    var profession: String { get }
    init(firstName: String, lastName: String)
}

class FootballPlayer: PersonProtocol {
    var firstName: String
    var lastName: String
    let profession = "Football"
    var position = "Unassigned"
    required init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

struct SwiftProgrammer: PersonProtocol {
    var firstName: String
    var lastName: String
    let profession = "Swift Programmer"
    var level: String = "Junior"
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

var myPerson: PersonProtocol
var peoples: [PersonProtocol] = []

// error - protocol cannot be instance
// var testPerson = PersonProtocol(firstName: "Bruce", lastName: "Huang", birthDate: "Engineer")

// polymorphism
myPerson = SwiftProgrammer(firstName: "Bruce", lastName: "Huang")
print("\(myPerson.firstName) \(myPerson.lastName)")
myPerson = FootballPlayer(firstName: "Dan", lastName: "Marino")
print("\(myPerson.firstName) \(myPerson.lastName)")

// error - use only properties and methods that defined in protocol itself
// myPerson.level

peoples.append(SwiftProgrammer(firstName: "Bruce", lastName: "Huang"))
peoples.append(FootballPlayer(firstName: "Dan", lastName: "Marino"))

for person in peoples {
    print("\(person.firstName) \(person.lastName)")
}

//type casting with protocol
for person in peoples {
    if person is SwiftProgrammer {
        print("\(person.firstName) \(person.lastName) is a Swift Programmer")
    }
}

for person in peoples {
    switch person {
    case is SwiftProgrammer:
        print("\(person.firstName) \(person.lastName) is a Swift Programmer")
    case is FootballPlayer:
        print("\(person.firstName) \(person.lastName) is a Football Player")
    default:
        print("\(person.firstName) \(person.lastName) is an unknown type")
    }
}

for person in peoples where person is SwiftProgrammer {
    print("\(person.firstName) \(person.lastName) is a Swift Programmer")
}

for person in peoples {
    if let p = person as? SwiftProgrammer {
        print("\(p.firstName) \(p.lastName) is a \(p.level) Swift Programmer ")
    }
}

// cast fail > as? > return nil
var p = peoples[0] as? FootballPlayer
// error - cast fail > as! throw error
// var f = peoples[0] as! FootballPlayer


// Protocol Oriented Programming
protocol DogProtocol {
    var name: String { get set }
    var color: String { get set }
    // 定義在這邊,所有遵循protocol都要修改
    func speak() -> String
}

extension DogProtocol {
    // 不用一一實作並實作預設內容
    func extSpeak() -> String {
        return "Woof Woof"
    }
}

struct JackRussel: DogProtocol {
    var name: String
    var color: String
    func speak() -> String {
        return "Woof Woof"
    }
}

class WhiteLab: DogProtocol {
    var name: String
    var color: String
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }

    func speak() -> String {
        return "Woof Woof"
    }
}

struct Mutt: DogProtocol {
    var name: String
    var color: String
    func speak() -> String {
        return "Woof Woof"
    }

    // override
    func extSpeak() -> String {
        return "Mutt is hungry"
    }
}

let dash = JackRussel(name: "Dash", color: "Brown")
let lily = WhiteLab(name: "Lily", color: "White")
let maple = Mutt(name: "Buddy", color: "Gray")
print(dash.speak())
print(dash.extSpeak())
print(lily.speak())
print(lily.extSpeak())
print(maple.speak())
print(maple.extSpeak())

// func可以不用重複 - 寫在protocol extension
protocol FatTextValidating {
    var regExMatchingString: String { get }
    var regExFindMatchingString: String { get }
    var validationMessage: String { get }
    func validateString(str: String) -> Bool
    func getMatchingString(str: String) -> String?
}

struct AlphaValidtion1: FatTextValidating {
    static let sharedInstance = AlphaValidtion1()
    private init() {}
    let regExFindMatchingString = "^[a-zA-Z]{0,10}"
    let validationMessage = "Can Only Contain Alpha Characters"
    var regExMatchingString: String {
        return regExFindMatchingString + "$"
    }
    func validateString(str: String) -> Bool {
        if let _ = str.range(of: regExMatchingString, options: .regularExpression) {
            return true
        }
        return false
    }
    func getMatchingString(str: String) -> String? {
        if let newMatch = str.range(of: regExFindMatchingString, options: .regularExpression) {
            return String(str[newMatch])
        }
        return nil
    }
}

// reduce by extension
protocol TextValidating {
    var regExFindMatchingString: String { get }
    var validationMessage: String { get }
}

extension TextValidating {
    var regExMatchingString: String {
        return regExFindMatchingString + "$"
    }

    func validateString(str: String) -> Bool {
        if let _ = str.range(of: regExMatchingString, options: .regularExpression) {
            return true
        }
        return false
    }

    func getMatchingString(str: String) -> String? {
        if let newMatch = str.range(of: regExFindMatchingString, options: .regularExpression) {
            return String(str[newMatch])
        }
        return nil
    }
}

struct AlphaValidtion: TextValidating {
    // singleton
    static let sharedInstance = AlphaValidtion()
    private init() {}

    let regExFindMatchingString = "^[a-zA-Z]{0,10}"
    let validationMessage = "Can Only Contain Alpha Characters"
}

struct AlphaNumbericValidtion: TextValidating {
    // singleton
    static let sharedInstance = AlphaNumbericValidtion()
    private init() {}

    let regExFindMatchingString = "^[a-zA-Z0-9]{0,15}"
    let validationMessage = "Can Only Contain Alpha Numberic Characters"
}

struct DisplayNameValidtion: TextValidating {
    // singleton
    static let sharedInstance = DisplayNameValidtion()
    private init() {}

    let regExFindMatchingString = "^[\\s?[a-zA-Z0-9\\-_\\s]]{0,15}"
    let validationMessage = "Can Only Contain Alpha Numberic Characters"
}

var testString = "abc123"
var theAlphaValidation = AlphaValidtion.sharedInstance
print(theAlphaValidation.getMatchingString(str: testString))
print(theAlphaValidation.validateString(str: testString))
