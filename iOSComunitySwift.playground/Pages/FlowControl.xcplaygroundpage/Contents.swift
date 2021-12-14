//: [Previous](@previous)

import Foundation

// if and if...else
let x: Int = 8
let y: Int = 9

if x < y {
    print("x<y")
}

let teamOne = 2
let teamTwo = 3
if teamOne > teamTwo {
    print("one > two")
} else if teamOne < teamTwo {
    print("one < two")
} else {
    print("one = two")
}

var opt1: Int? = 100
var opt2: Int? = 200
print(type(of: opt1))
print(type(of: opt2))
if let opt1 = opt1 {
    if let opt2 = opt2 {
        print("\(opt1)_\(opt2)")
    }
}

if let opt1 = opt1, let opt2 = opt2 {
    print(type(of: opt1))
    print(type(of: opt2))
    print("\(opt1)_\(opt2)")
}

if let opt1 = opt1, let opt2 = opt2, teamTwo >= 100 {
    print("\(opt1)_\(opt2)_\(teamTwo)")
}

// optional binding與logic不可混用
//if let opt1 = opt1, let opt2 = opt2 || teamTwo < opt1 {
//    print("\(opt1)_\(opt2)")
//}

enum MyResult {
    case success
    case failure(message: String)
}
let result: MyResult = .failure(message: "無情單殺")
if case let .failure(message) = result {
    print(message)
}

// guard
func isNotBlank(str: String?) -> Bool {
    guard let str = str else {
        return false
    }
    return !str.isEmpty
}
var str: String? = nil
print(isNotBlank(str: str))
str = ""
print(isNotBlank(str: str))
str = "Stanleny"
print(isNotBlank(str: str))

func transfer(from: String?, receive: String?, amount: Int?) {
    guard
        let from = from,
        let receive = receive,
        let amount = amount,
        !from.isEmpty,
        !receive.isEmpty,
        amount > 0
    else {
        print("transfer fail")
        return
    }
    print("trnasfer from \(from) to \(receive) amount = \(amount)")
}
transfer(from: nil, receive: "", amount: -100)
transfer(from: "132456", receive: "444444", amount: 100)

// switch
// 不須要break
let speed = 300_000_000
switch speed {
case 300_000_000:
    print("speed of light")
case 340:
    break
default:
    print("unknown speed")
}

// error - 必須要有default
// let num = 5
// switch num {
//    case 1:
//        print("One")
//    case 2:
//        print("Two")
//    case 3:
//        print("Three")
// }

// multiple items in single case
var c: Character = "e"
switch c {
case "a", "e", "i", "o", "u":
    print("letter is vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("letter is a consonant")
default:
    print("unknown letter")
}

// switch statement is range
var grade = 93
switch grade {
case 90 ... 100:
    print("grade is an A")
case 80 ... 89:
    print("grade is an B")
case 70 ... 79:
    print("grade is an C")
case 60 ... 69:
    print("grade is an D")
case 0 ... 59:
    print("grade is an F")
default:
    print("unknown grade")
}

// 若提供所有的狀態就可以省略default
enum Product {
    case Book(String, Double, Int)
    case Puzzle(String, Double)
}
let order: Product = .Book("Mastering Swift 4", 49.99, 20)
switch order {
case let .Puzzle(name, price):
    print("name = \(name) , price = \(price)")
default:
    print("the default")
}
switch order {
case let .Puzzle(name, price):
    print("name = \(name) , price = \(price)")
case let .Book(name, price, count):
    print("name = \(name) , price = \(price) , \(count)")
}

// fallthrough
let pName = "Jon"
let pSport = "Baseball"
switch pSport {
case "Baseball":
    print("\(pName) plays Baseball")
    fallthrough
case "Basketball":
    print("\(pName) plays Basketball")
    fallthrough
default:
    print("unknown sport")
}

// for-in
// 預設let(可省略)
for idx in 1...5 {
    // compiler error
    //idx += 1
    print(idx)
}

// 要修改內容就要設為var
for var idx in 1..<6 {
    idx += 1
    print(idx)
}

// array
let countries = ["UK", "USA", "JP"]
for country in countries {
    print("country is \(country)")
}
for row in countries.enumerated() {
    print("\(row.offset + 1).country is \(row.element)")
}

// dictionary
var countryNames = ["US": "United States", "UK": "United Kingdom", "JP": "Japan"]
for (abbr, name) in countryNames {
    print("abbr = \(abbr) , name = \(name)")
}
for tup in countryNames {
    print("abbr = \(tup.key) , name = \(tup.value)")
}

// continue
for i in 1 ... 10 {
    if i % 2 == 0 {
        continue
    }
    print("\(i) is odd")
}
// break
for i in 1 ... 10 {
    if i % 2 == 0 {
        break
    }
    print("\(i) is odd")
}

//倒序 - reverse
for index in (1...5).reversed() {
    print("\(index) times 5 is \(index * 5)")
}

// stride - 自行決定間距
for index in stride(from: 0, to: countries.count - 1, by: 1) {
    print("\(index + 1).country is \(countries[index])")
}
for index in stride(from: 5, to: 0, by: -1) {
    print("\(index) times 5 is \(index * 5)")
}

// while
var ran = 0
while ran < 7 {
    print("ran = \(ran)")
    ran = .random(in: 1...20)
}

// repeat-while
var random: Int = 0
repeat {
    random = .random(in: 1...20)
    print("random = \(random)")
} while random < 7


// where + conditional statement
for idx in 1 ... 30 {
    if idx % 2 == 0 {
        print("idx = \(idx) is even")
    }
}
for idx in 1 ... 30 where idx % 2 == 0 {
    print("idx = \(idx) is even")
}
grade = 58
var studId = 4
switch grade {
case 90 ... 100:
    print("grade is an A")
case 80 ... 89:
    print("grade is an B")
case 70 ... 79:
    if studId == 3 {
        print("grade is an C")
    }
case 55 ... 69 where studId == 4:
    print("grade is an D for student 4")
case 60 ... 69:
    print("grade is an D")
case 0 ... 59:
    print("grade is an F")
default:
    print("unknown grade")
}

extension Array {
    mutating func intRandom(size: UInt, range: ClosedRange<Element>) where Element == Int {
        self.removeAll()
        for _ in 1...size {
            self.append(.random(in: range))
        }
    }
}
var intArray: [Int] = []
intArray.intRandom(size: 10, range: 1...100)
print(intArray)
var strArray: [String] = []
// compiler error: 找不到方法
//strArray.intRandom(size: 20, range: 1...100)

protocol CustomSubscriber {
    associatedtype Input
    associatedtype Failure
}
class IntSubscription<S: CustomSubscriber> where S.Input == Int, S.Failure == Never {
    
}

// case + condictional statement
var worldSeriesWinners = [
    ("Red Sox", 2004),
    ("White Sox", 2005),
    ("Cardinals", 2006),
    ("Red Sox", 2007),
    ("Phillies", 2008),
    ("Yankees", 2009),
    ("Giants", 2010),
    ("Cardinals", 2011),
    ("Giants", 2012),
    ("Red Sox", 2013),
    ("Giants", 2014),
    ("Royals", 2015),
]
for case let ("Red Sox", year) in worldSeriesWinners {
    print("Red Sox won the \(year) World Series")
}
for row in worldSeriesWinners where row.0 == "Red Sox" {
    print("Red Sox won the \(row.1) World Series")
}

let myNumbers: [Int?] = [1, 2, nil, 4, 5, nil, 7]
for case let .some(num) in myNumbers {
    print("\(num)")
}
// some()的縮寫: ?
for case let num? in myNumbers where num > 3 {
    print("\(num)")
}


