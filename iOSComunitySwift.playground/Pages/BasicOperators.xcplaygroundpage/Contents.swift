//: [Previous](@previous)

import Foundation

// assignment
let x = 1
let y = "Hello"
let z = y
let (a, b) = (1, 2)
print(a)
print(b)
// runtime error - assignment不會有回傳值
//var i = 1
//while i = 1 {
//    print("i = \(i)")
//}

// comparison
print(2 == 1)
print(2 != 1)
print(2 > 1)
print(2 < 1)
print(2 >= 1)
print(2 <= 1)

// arithmetic
print(4 + 2)
print(4 - 2)
print(4 * 2)
print(4 / 2)

// remainder
print(4 % 2)

// compound assignment
var value: Int = 10
value += 2
print(value)
value -= 2
print(value)
value *= 2
print(value)
value /= 2
print(value)

// ternary conditional
var t1 = 2
var t2 = 3
var t3 = t1 > t2 ? 10 : 20
print(t3)

// logical
var isX = true
var isY = !isX
print(isY)
print(isX && isY)
print(isX || isY)

// closed range
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

// half-open range
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}

// one-sided range
for name in names[2...] {
    print(name)
}
for name in names[...2] {
    print(name)
}
for name in names[..<2] {
    print(name)
}

let pRange: PartialRangeThrough = ...5
print(pRange.contains(7))
print(pRange.contains(4))
print(pRange.contains(-1))

let fRange: PartialRangeFrom = 1...
print(fRange.contains(0))
print(fRange.contains(4))
print(fRange.contains(-1))

let cRange: ClosedRange = 1...5
print(cRange.contains(7))
print(cRange.contains(4))
print(cRange.contains(-1))
