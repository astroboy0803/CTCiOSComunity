import Foundation
import UIKit

func aaa(closure: (String) -> Void) {
    closure("aaa")
}

// function
func sayHello(name: String) {
    print("Hello \(name)")
}

aaa(closure: sayHello(name:))

// 預設為Void
func sayHello2(name: String) -> Void {
    print("Hello \(name)")
}
func rtnHello(name: String) -> String {
    return "Hello \(name)"
}

sayHello(name: "Jon")
let hello = rtnHello(name: "Sam")
print(hello)

rtnHello(name: "not receive")

// underscore can avoid warning
_ = rtnHello(name: "not receive")

// discardableResult can avoid warning
@discardableResult
func discardHello(name: String) -> String {
    return "Hello \(name)"
}
discardHello(name: "discard")

// function可以包function
func outFunction() {
    func inFunction() {
        
    }
}

// multiple parameters - Void can be ignored
func sayGreet(name: String, greeting: String) {
    print("\(greeting) \(name)")
}
sayGreet(name: "Jon", greeting: "Hello")
// error - 呼叫參數順序不可調換
// sayGreet(greeting: "Hello",name: "Jon")

// parameter define default value
func sayGreetUseDefault(name: String, greeting: String = "Hello") {
    print("\(greeting) \(name)")
}
sayGreetUseDefault(name: "Bruce")
sayGreetUseDefault(name: "Bruce", greeting: "Hi")
func sayGreetDefaultValues(name: String = "Jon", name2: String = "Frank", greeting: String = "Hello") {
    print("\(greeting) \(name) and \(name2)")
}
sayGreetDefaultValues()
sayGreetDefaultValues(name2: "Bruce", greeting: "Hi")

// return multiple values
func getNames() -> [String] {
    return ["Jon", "Bruce", "Frank"]
}
var names = getNames()
func getTeam() -> (name: String, win: Int, percent: Double) {
    return ("Red Sox", 89, 60.5)
}
var team = getTeam()
print("\(team.name) had \(team.win) wins and win percent is \(team.percent)%")

// return optional value
// error - return nil
// func rtnNil() -> String {
//    return nil
// }
func rtnNilUseOptional() -> String? {
    return nil
}
func getTeam2(id: Int) -> (name: String, win: Int, percent: Double)? {
    if id == 1 {
        return ("Red Sox", 80, 65.0)
    }
    return nil
}
func getTeam3(id _: Int) -> (name: String, win: Int, percent: Double?) {
    return ("Red Sox", 80, nil)
}

// Internal and external parameter
func winPercentage(baseballTeam _: String, withWins wins: Int, andLoses loses: Int) -> Double {
    return Double(wins) / Double(loses + wins)
}
winPercentage(baseballTeam: "White Sox", withWins: 60, andLoses: 70)

func funcName(out inName: Int) {
    print(inName)
}
funcName(out: 10)

func funcName2(_ inName: Int) {
    print(inName)
}
funcName2(10)

// variadic parameter
func sayMultiGreeting(greeting: String..., names: String...) {
    for name in names {
        print("\(greeting) name: \(name)")
    }
}
sayMultiGreeting(greeting: "Hi", "ad", "c", names: "Bill", "Alasa")

// inout parameter - call by reference(參數結果會回傳)
func inoutReverse(first: inout String, second: inout String) {
    let tmp = first
    first = second
    second = tmp
}
var one = "One"
var two = "Two"
print("One=\(one) , Two=\(two)")
inoutReverse(first: &one, second: &two)
print("One=\(one) , Two=\(two)")

//test IPV4
func isValidIP(ipAddr: String?) -> Bool {
    guard let ipAddr = ipAddr else {
        return false
    }
    let octets = ipAddr.split(separator: ".").map {
        String($0)
    }
    guard octets.count == 4 else {
        return false
    }
    for octet in octets {
        guard validOctet(octet: octet) else {
            return false
        }
    }
    return true
}

func validOctet(octet: String) -> Bool {
    guard let num = Int(octet), num >= 0 && num < 256 else {
        return false
    }
    return true
}
print(isValidIP(ipAddr: nil))
print(isValidIP(ipAddr: "255255255255"))
print(isValidIP(ipAddr: "256.256.256.256"))
print(isValidIP(ipAddr: "10.25.3.69"))

// clousre
// create & use closure
let clos1 = { () -> Void in
    print("Hello")
    print("Word")
}
clos1()
let clos1_1 = { () -> () in
    print("Hello")
    print("Word")
}
clos1_1()

let clos2 = { (name: String) -> Void in
    print("Hello \(name)")
}
clos2("Burce")

// 可以被傳遞
func testClosure(handler: (String) -> Void) {
    handler("Dasher")
}
testClosure(handler: clos2)

// 有回傳值, 一行的話可以省略return
let clos3 = { (name: String) -> String in
    "Hello \(name)"
}
var message = clos3("Buddy")

// 沒有參數和回傳值的話，接參數的地方可直接省略
let noparam = {
    print("無參數無回傳值")
}
noparam()

// anonymous clousre
func testFunction(num: Int, handler: () -> Void) {
    for _ in 0 ..< num {
        handler()
    }
}
let clos = { () -> Void in
    print("Hello from standard syntax")
}
testFunction(num: 1, handler: clos)
testFunction(num: 1, handler: {
    print("Hello from shorthand syntax 1")
})

// shorthand方式接參數
func testFunction2(num: Int, handler: (_: String) -> Void) {
    for _ in 0 ..< num {
        handler("Me")
    }
}
testFunction2(num: 1) {
    print("Hello from \($0)")
}

let clos5: (String, String) -> Void = {
    print("\($0) \($1)")
}
clos5("Hello", "Bruce")
// compiler error - anonymous arguments不可以使用標準的closure
// let clos5b = { (String,String) -> Void in
//    print("\($0) \($1)")
// }
let collp: (String, Int) -> Void = {
    print($1)
}

let clos6: () -> Void = {
    print("return empty")
}
let clos6b = { () -> Void in
    print("return empty 2")
}
clos6()
clos6b()

func codeSwift(type: Int, cb: (Int, String) -> String) {
    print(cb(type, "codeSwift"))
}

func codeSwift2(cb: () -> String) {
    print(cb())
}

// function和closure是相似的
let funcNm = codeSwift2
funcNm {
    return "abc"
}
func funcClosure(a: String, b: String) {
    print("\(a),\(b)")
}
func iClousre(handler: (String, String) -> Void) {
    handler("is A", "is B")
}
iClousre(handler: funcClosure(a:b:))
//iClousre {
//    funcClosure(a: $0, b: $1)
//}

// Trailing Closures 1 - 最後一個參數為closure可以提到外面
codeSwift(type: 2, cb: { type, text -> String in
    return "shorthand syntax Type \(type)-1 in \(text) functions"
})
codeSwift(type: 2) { (type: Int, text: String) -> String in
    return "shorthand syntax Type \(type)-1 in \(text) functions"
}

// Trailing Closures 2 - 當方法只有一個clousre參數,可以省略括號
codeSwift2(cb: {
    return "shorthand syntax Type 2-2 in codeSwift2 functions"
})
// Trailing Closures 1
codeSwift2() { () -> String in
    return "shorthand syntax Type 2-2 in codeSwift2 functions"
}
codeSwift2 { () -> String in
    return "shorthand syntax Type 2-2 in codeSwift2 functions"
}

// Inferring Type From Context
codeSwift(type: 3) { type, text in
    return "shorthand syntax Type \(type) in \(text) functions"
}

// escaping closures
var handlers: [() -> Void] = []
func ecsapingFunction(handler: @escaping () -> Void) {
    handlers.append(handler)
}

// advance
// Operator Methods 應用 - operator都是由Function定義
func codeSwift3(type: Int, cb: (String, String) -> String) {
    let text = cb("Operator ", "Method")
    print("shorthand syntax Type \(type)(\(text)) in codeSwift3 functions")
}
codeSwift3(type: 6, cb: +)

// closure with array
let guests = ["Jon", "Kim", "Amber", "Bruce"]
guests.map { name in
    print("Hello \(name)")
}

var helloNames = guests.map {
    "Welcome \($0)"
}

for helloName in helloNames {
    print(helloName)
}

let greetGuest = { (name: String) -> Void in
    print("Hello guest named \(name)")
}

let sayGoodbye = { (name: String) -> Void in
    print("Goodbye \(name)")
}

guests.map(greetGuest)
guests.map(sayGoodbye)

let greetGuest2 = { (name: String) -> Void in
    if name.hasPrefix("K") {
        print("\(name) is on the guest list")
    } else {
        print("\(name) was not invited")
    }
}
guests.map(greetGuest2)

func temperatures(calculate: (Int) -> Void) {
    let tempAry = [72, 74, 76, 68, 70, 72, 66]
    tempAry.map(calculate)
}

func addTemperature() {
    var total = 0
    var count = 0
    let addTemps = {
        (num: Int) -> Void in
        total += num
        count += 1
    }
    temperatures(calculate: addTemps)
    print("count = \(count)")
    print("total = \(total)")
    print("Average = \(total / count)")
}
addTemperature()

// standalone closure & good style
class Guests {
    var guestNames = ["Jon", "Kim", "Amber", "Bruce", "Kaily", "Dash", "Lily"]
    typealias UseArrayClosure = ([String]) -> Void
    func getGuests(handler: UseArrayClosure) {
        handler(guestNames)
    }
}

func getData() {
    let dataClosure: Guests.UseArrayClosure = {
        for name in $0 {
            // do something for data,ex:tableview.load
            print("name = \(name)")
        }
    }
    let guests = Guests()
    guests.getGuests(handler: dataClosure)
}

// changing functionality
struct TestType {
    typealias getNumClosure = (Int, Int) -> Int

    var numOne = 5
    var numTwo = 8
    var result = 0

    mutating func getNum(handler: getNumClosure) -> Int {
        result = handler(numOne, numTwo)
        print("result = \(result)")
        return result
    }
}

var max: TestType.getNumClosure = {
    if $0 > $1 {
        return $0
    }
    return $1
}

var min: TestType.getNumClosure = {
    if $0 < $1 {
        return $0
    }
    return $1
}

var multiply: TestType.getNumClosure = {
    $0 * $1
}

var second: TestType.getNumClosure = {
    $1
}

var answer: TestType.getNumClosure = { _, _ in
    42
}

var testType = TestType()
testType.getNum(handler: max)
testType.getNum(handler: min)
testType.getNum(handler: multiply)
testType.getNum(handler: second)
testType.getNum(handler: answer)

class TestType2 {
    typealias ResultClosure = (String) -> Void
    func isGreater(numOne: Int, numTwo: Int, successHandler: ResultClosure, failureHandler: ResultClosure) {
        if numOne > numTwo {
            successHandler("\(numOne) is greater than \(numTwo)")
        } else {
            failureHandler("\(numOne) is not greater than \(numTwo)")
        }
    }
}

var success: TestType2.ResultClosure = {
    print("Success: \($0)")
}

var failure: TestType2.ResultClosure = {
    print("Failure: \($0)")
}

var test2 = TestType2()
test2.isGreater(numOne: 8, numTwo: 6, successHandler: success, failureHandler: failure)

// strong reference cycle
class TestClassOne {
    typealias nameClousre = () -> String
    var name = "Jon"
    lazy var myClosure: nameClousre = {
        self.name
    }

    deinit {
        print("TestClassOne deinit")
    }
}

class TestClassTwo {
    func closureExample(handler: TestClassOne.nameClousre) {
        print(handler())
    }

    deinit {
        print("TestClassTwo deinit")
    }
}

class TestClassThree {
    typealias nameClousre = () -> String
    var name = "Jon"
    lazy var myClosure: nameClousre = {
        "Jon"
    }

    deinit {
        print("TestClassThree deinit")
    }
}

class TestClassFour {
    typealias nameClousre = () -> String
    var name = "Jon"
    lazy var myClosure: nameClousre = {
        [unowned self] in
        self.name
    }

    deinit {
        print("TestClassFour deinit")
    }
}

var testOne: TestClassOne? = TestClassOne()
var testTwo: TestClassTwo? = TestClassTwo()
testTwo?.closureExample(handler: testOne!.myClosure)
testOne = nil
print("testOne is gone")
testTwo = nil
print("testTwo is gone")

print("-------------------")
// success - 沒有使用屬性
var testThree: TestClassThree? = TestClassThree()
var testTwo1: TestClassTwo? = TestClassTwo()
testTwo1?.closureExample(handler: testThree!.myClosure)
testThree = nil
print("testThree is gone")
testTwo1 = nil
print("testTwo1 is gone")

print("-------------------")
// use weak or unowned
var testFour: TestClassFour? = TestClassFour()
var testTwo2: TestClassTwo? = TestClassTwo()
testTwo2?.closureExample(handler: testFour!.myClosure)
testFour = nil
print("testFour is gone")
testTwo2 = nil
print("testTwo2 is gone")
