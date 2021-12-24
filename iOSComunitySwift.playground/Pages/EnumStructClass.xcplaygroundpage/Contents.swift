//: [Previous](@previous)

import Foundation
import CoreGraphics

// define class & structure
class MyClass {
    // store properties
    let c: Int = 1
    var v = "class"
}

struct MyStruct {
    // store properties
    let c: Int
    var v = ""
}

// create instance - struct
var theStruct = MyStruct(c: 10, v: "struct")
// set & get properties
print("theStruct \(theStruct.c) \(theStruct.v)")
theStruct.v = "newStruct"
print("theStruct \(theStruct.c) \(theStruct.v)")

// create instance - class
var theClass = MyClass()
print("theClass \(theClass.c) \(theClass.v)")

class EmployeeClass {
    var firstName: String
    var lastName: String
    var salaryYear: Double

    // init
    init() {
        firstName = ""
        lastName = ""
        salaryYear = 0.0
    }

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        salaryYear = 0.0
    }

    init(firstName: String, lastName: String, salaryYear: Double) {
        self.firstName = firstName
        self.lastName = lastName
        self.salaryYear = salaryYear
    }

    // external parameter
    init(employeeWithFirstName firstName: String, LastName lastName: String, andSalaryYear salaryYear: Double) {
        self.firstName = firstName
        self.lastName = lastName
        self.salaryYear = salaryYear
    }

    // failable Initializer
    init?(empWithFirstName firstName: String, LastName lastName: String, andSalaryYear salaryYear: Double) {
        if salaryYear < 20000 {
            return nil
        }
        self.firstName = firstName
        self.lastName = lastName
        self.salaryYear = salaryYear
    }

    // compute properity - read-only
    var salaryWeek: Double {
        // self
        return salaryYear / 52
    }

    // ignore get keyword
    var salaryDay: Double {
        return salaryWeek / 7
    }

    var salaryHour: Double {
        get {
            return salaryDay / 8
        }
        // set (newSalaryHour) {
        // self.salaryYear = newSalaryHour * 8 * 7 * 52
        // }
        // ignore parameter > use default parameter's name > newValue
        set {
            salaryYear = newValue * 8 * 7 * 52
        }
    }

    // method
    func getFullName() -> String {
        return "\(firstName) \(lastName)"
    }

    func giveRase(amount: Double) {
        salaryYear += amount
    }
}

struct EmployeeStruct {
    var firstName: String
    var lastName: String

    // init
    init() {
        firstName = ""
        lastName = ""
        salaryYear = 0.0
    }

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        salaryYear = 0.0
    }

    init(firstName: String, lastName: String, salaryYear: Double) {
        self.firstName = firstName
        self.lastName = lastName
        self.salaryYear = salaryYear
    }

    // external parameter
    init(employeeWithFirstName firstName: String, LastName lastName: String, andSalaryYear salaryYear: Double) {
        self.firstName = firstName
        self.lastName = lastName
        self.salaryYear = salaryYear
    }

    // failable Initializer
    init?(empWithFirstName firstName: String, LastName lastName: String, andSalaryYear salaryYear: Double) {
        if salaryYear < 20000 {
            return nil
        }
        self.firstName = firstName
        self.lastName = lastName
        self.salaryYear = salaryYear
    }

    var salaryYear: Double {
        // property observers
        willSet {
            print("new SalaryYear = \(newValue)")
        }
        didSet {
            if salaryYear > oldValue {
                print("\(salaryYear) > \(oldValue)")
            } else {
                print("\(salaryYear) <= \(oldValue)")
            }
        }
    }

    // compute properity - read-only
    var salaryWeek: Double {
        // self
        return salaryYear / 52
    }

    // ignore get keyword
    var salaryDay: Double {
        return salaryWeek / 7
    }

    var salaryHour: Double {
        get {
            return salaryDay / 8
        }
        // set (newSalaryHour) {
        // self.salaryYear = newSalaryHour * 8 * 7 * 52
        // }
        // ignore parameter > use default parameter's name > newValue
        set {
            salaryYear = newValue * 8 * 7 * 52
        }
    }

    // method
    func getFullName() -> String {
        return "\(firstName) \(lastName)"
    }

    // error - be not allowed to update property in struct
    // func giveRase(amount:Double) {
    // self.salaryYear += amount
    // }

    // mutating
    mutating func giveRase(amount: Double) {
        salaryYear += amount
    }

    // self > distinguish between local and instance variable
    func isEqualFirstName(firstName: String) -> Bool {
        return self.firstName == firstName
    }
}

var theEmployeeStruct = EmployeeStruct(firstName: "Jon", lastName: "Hoffman", salaryYear: 39000)
print("salaryYear = \(theEmployeeStruct.salaryYear) , salayWeek = \(theEmployeeStruct.salaryWeek) ")
theEmployeeStruct.salaryHour = 15
print("salaryYear = \(theEmployeeStruct.salaryYear) , salayWeek = \(theEmployeeStruct.salaryWeek) ")
print(theEmployeeStruct.getFullName())

var firstEmployeeClass = EmployeeClass()
var secondEmployeeClass = EmployeeClass(firstName: "Bruce", lastName: "Huang")
var thirdEmployeeClass = EmployeeClass(firstName: "Amber", lastName: "Wang", salaryYear: 6000.0)
var externalEmployeeClass = EmployeeClass(employeeWithFirstName: "Curry", LastName: "Stephen", andSalaryYear: 356_126_356.658_698)

if let failableEmployeeClass = EmployeeClass(empWithFirstName: "failable", LastName: "Initializer", andSalaryYear: 19000) {
    print(failableEmployeeClass.getFullName())
} else {
    print("Fail to Initializer")
}

// access control
open class acTest4 {}
private class acTest1 {}
public struct acTest2 {}
internal var acTest3 = "abc"
fileprivate var acTest5 = 6.0
class t: acTest4 {}
// public的class不可以被繼承
// class p : acTest2 {}

// inheritance
class Plant {
    var height = 0.0
    var age = 0
    var description: String {
        return "Base class is Plant"
    }

    func growHeight(inches: Double) {
        height += inches
    }

    func getDetails() -> String {
        return "Height : \(height) age : \(age)"
    }

    final func getBaseName() -> String {
        return "Plant"
    }
}

class Tree: Plant {
    var limbs = 0
    override var description: String {
        return "\(super.description) I am a Tree class"
    }

    func limbGrow() {
        limbs += 1
    }

    func limbFall() {
        limbs -= 1
    }

    // error - duplicate
    // func getDetails() -> String {}
    // error - superclass can't find the method
    // override func rideMethod() {}
    override func getDetails() -> String {
        let supDetails = super.getDetails()
        return "\(supDetails) limbs : \(limbs)"
    }

    // error - final property or method can't be override
    // override func getBaseName() -> String {
    // return "Plant"
    // }
}

var theTree = Tree()
theTree.age = 5
theTree.height = 4
theTree.limbGrow()
theTree.limbGrow()

class PineTree: Tree {
    var needles = 0
}

class OkaTree: Tree {
    var leaves = 0
}

var thePlant = Plant()
print(thePlant.getDetails())
print(theTree.getDetails())
print(thePlant.description)
print(theTree.description)

// protocol - define
protocol MyProtocol {}
protocol MyOtherProtocol {}
class theTreeWithProtocol: Plant, MyProtocol, MyOtherProtocol {}

// protocol - property & method requirement
protocol FullName {
    var firstName: String {
        get set
    }
    var lastName: String {
        get set
    }
    var readOnly: String {
        get
    }
    func getFullName() -> String
}
class Scientist: FullName {
    var firstName = ""
    var lastName = ""
    var readOnly = ""
    var field = ""
    func getFullName() -> String {
        return "\(firstName) \(lastName) studies \(field)"
    }
}

struct FootballPlayer: FullName {
    var firstName: String = ""
    var lastName: String = ""
    var readOnly: String = ""
    var number = 0
    func getFullName() -> String {
        return "\(firstName) \(lastName) has the number \(number)"
    }
}

var theScientist = Scientist()
theScientist.firstName = "Bruce"
theScientist.lastName = "Huang"
theScientist.field = "Computer"

var theFootballPlayer = FootballPlayer()
theFootballPlayer.firstName = "Dan"
theFootballPlayer.lastName = "Marino"
theFootballPlayer.number = 13

// protocol - decouple
var thePerson: FullName
thePerson = theScientist
print(thePerson.getFullName())
thePerson = theFootballPlayer
print(theFootballPlayer.getFullName())

// extension
extension String {
    var firstLetter: Character? {
        return first
    }

    func reverse() -> String {
        var reverse = ""
        map {
            reverse = "\($0)" + reverse
        }
        // for letter in self.characters {
        // reverse = "\(letter)" + reverse
        // }
        return reverse
    }
}
var strTest = "Mastering Swift 4"
print(strTest.reverse())
print(strTest.firstLetter)

// Class Initializer
class Papa {
    let c: Int
    let s: String
    // designated initializer
    init(value: Int, str: String) {
        c = value
        s = str
    }
    init?(str: String) {
        return nil
    }
    // convenience initializer
    convenience init() {
        self.init(value: 0, str: "")
    }
    // required initializer
    required init(name: String) {
        self.s = name
        self.c = 0
    }
}

class Son: Papa {
    let n: String
    // subclass有定義初始化，必須實作super的require initializer
    init(n: String) {
        self.n = n
        super.init()
    }
    
    required init(name: String) {
        fatalError("init(name:) has not been implemented")
    }
}


// enumeration
// create - normal
enum Planets {
    case Mercury
    case Venus
    case Earth
    case Mars
    case Jupiter
    case Saturn
    case Uranus
    case Neptune
    
    func getValue() -> String {
        switch self {
        case .Mercury:
            return "abc"
        default:
            return "123"
        }
    }
}
// create - short
enum ShortPlanets: CaseIterable {
    case Mercury, Venus, Earth, Mars
    case Jupiter, Saturn, Uranus, Neptune
}

let furthestPlant = ShortPlanets.Jupiter

var planetWeLivingOn: Planets = .Earth
planetWeLivingOn = .Mars

// comparsion
switch furthestPlant {
case .Mercury:
    break
case .Venus:
    print("Venus...")
case .Earth:
    print("Earth...")
case .Mars:
    break
case .Jupiter:
    print("Jupiter...")
case .Saturn:
    print("Saturn...")
case .Uranus:
    break
case .Neptune:
    break
}

// compiler error - 沒有列出所有case
//    switch furthestPlant {
//    case .Mars:
//        print("Mars")
//    }

switch planetWeLivingOn {
case .Mercury:
    print("Mercury")
case .Earth:
    print("Earth")
case .Mars:
    print("Mars")
default:
    print("default")
}

if planetWeLivingOn == .Earth {
    print("Living in Earth")
} else {
    print("Living in \(planetWeLivingOn)")
}

// CaseIterable
print(ShortPlanets.allCases)
for planet in ShortPlanets.allCases {
    print(planet)
}
// compiler error: 沒有comform CaseIterable無法使用
//print(Planets.allCase)

// 定義型別
enum Devices: String {
    case MusicPlayer = "iPod"
    case Phone = "iPhone"
    case Tablet // 不給rawValue = Tablet
}

enum IntPlants: Int {
    case Mercury
    case Venus = 2
    case Earth
    case Mars
    case Jupiter
    case Saturn
    case Uranus
    case Neptune
}

// compiler error - has no member(要有指定型態才可使用rawValue)
// print(planetWeLivingOn.rawValue)
print("We are using an \(Devices.Tablet.rawValue)")
print("Earth is planet number \(IntPlants.Earth.rawValue)")
if let numPlant = IntPlants(rawValue: 0) {
    print("the plant is \(numPlant)")
}

// associated value
enum Product {
    case Book(Double, Int, Int)
    case Puzzle(Double, Int)
}
var pBook = Product.Book(49.99, 2017, 310)
switch pBook {
case let .Book(price, year, pages):
    print("Mastering Swift was published in \(year) for the price of \(price)and has \(pages) pages")
case .Puzzle(let price, let pieces):
    print("Mastering Swift is a puzzle with \(pieces) and sells for \(price)")
}

var pPuzzle = Product.Puzzle(9.99, 200)
switch pPuzzle {
case var .Book(price, year, pages):
    year += 100
    price += 2
    pages += 6
    print("World Puzzle was published in \(year) for the price of \(price) and has \(pages) pages")
case .Puzzle(let price, var pieces):
    // compiler error: 常數不可更改
    //price += 100
    pieces -= 50
    print("World Puzzle is a puzzle with \(pieces) and sells for \(price)")
}

enum NewProduct {
    case Book(price: Double, year: Int, pages: Int)
    case Puzzle(price: Double, pieces: Int)
}
let nBook: NewProduct = .Book(price: 100, year: 2000, pages: 650)
switch nBook {
case let .Book(price, year, pages):
    print("World Puzzle was published in \(year) for the price of \(price) and has \(pages) pages")
case let .Puzzle(price, pieces):
    print("World Puzzle is a puzzle with \(pieces) and sells for \(price)")
}

// 不可混用
// compiler error - associated value就不能設定型態
//enum BProduct: String {
//    case Book
//    case Puzzle(Double, Int)
//}

// optional is enum
var iOpt: Double? = nil
if case .none = iOpt {
    print("is nil")
}

iOpt = 10.32
if case let .some(value) = iOpt {
    print(value)
}


// namespace
enum StaticType {
    class C1 {}
    class C2 {}
    struct S1 {}
    struct S2 {}
}
StaticType.C1()
StaticType.S1()

class Container {
    struct S1 {}
    struct S2 {}
    enum CType {}
}
Container.S1()

struct Structure {
    class C1 {}
    class C2 {}
    enum CType {}
}
Structure.C1()
