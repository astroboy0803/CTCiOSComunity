//: [Previous](@previous)

import Foundation

// Array - Create and Initialize
let ary0: [Int] = [Int](arrayLiteral: 1, 2, 3)
let ary1: Array<Int> = [1, 2, 3]
let ary2: [Int] = [1, 2, 3] // 最推薦的寫法
let ary3 = [1, 2, 3] // type inference: [] -> array, type為int
var ary4 = [Int](arrayLiteral: 1, 2, 3)
var ary5 = Array<Int>(arrayLiteral: 1, 2, 3)

// any or anyobject(只能為class)
let anyAry: [Any] = [0, 3.6, "abc", Data()]
class Class1 {}
class Class2 {}
let cObjAry: [AnyObject] = [Class1(), Class2()]

// 最後元素後的逗號可以保留
let myAry: [Int] = [1, 2, 3,]

// Iterating
for ele in myAry {
    print(ele)
}

for row in myAry.enumerated() {
    print("\(row.offset) = \(row.element)")
}

// what's difference
var gAry0: [Int] = [1, 2, 3] // TODO:
var gAry1: [Int?] = [1, 2, 3] // TODO:
var gAry2: [Int]? = [1, 2, 3] // TODO:
var gAry3: [Int?]? = [1, 2, 3] // TODO:

// access and replace
print(gAry0[0])
print(gAry0[2])
print(gAry0.first)
print(gAry0.last)
// runtime error: Index out of range
//print(gAry0[4])
//gAry0[4] = 10
gAry0[0] = 10
print(gAry0[0])

// empty and count
print(gAry0.count)
print(gAry0.isEmpty)

// Add and remove
print(gAry0)
gAry0.append(4)
print(gAry0)
gAry0 += [5, 6, 7]
print(gAry0)
// runtime error: Index is out of range
//gAry0.insert(1, at: gAry0.count + 1)
gAry0.insert(1, at: 1)
print(gAry0)
print(gAry0.remove(at: 1))
print(gAry0)
print(gAry0.removeFirst())
print(gAry0)
print(gAry0.removeLast())
print(gAry0)
gAry0.removeAll()
print(gAry0.count)

// Merge and SubArray
let fAry = [1, 2, 3]
let sAry = [4, 5, 6]
let tAry = [7, 8, 9]
let frAry = fAry + sAry + tAry
print(frAry)

let subAry1 = frAry[2...4]
let subAry2 = frAry[..<4]
let subAry3 = frAry[...4]
let subAry4 = frAry[2...]

// Bulk changes
var bulkAry = [1, 2, 3, 4, 5]
bulkAry[1...2] = [11, 12]
print(bulkAry)
bulkAry[1...3] = [2, 3]
print(bulkAry)
bulkAry[1...3] = [12, 13, 14, 15]
print(bulkAry)

// array methods - next

//// Set
//let aSet: Set<Int> = [1,5,6,9,25,1,5,669,2]
//print(aSet)
//print(type(of: aSet))
//let bSet: Set<Int> = .init()
//print(type(of: bSet))
