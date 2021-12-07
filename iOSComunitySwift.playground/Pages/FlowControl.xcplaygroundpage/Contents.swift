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
