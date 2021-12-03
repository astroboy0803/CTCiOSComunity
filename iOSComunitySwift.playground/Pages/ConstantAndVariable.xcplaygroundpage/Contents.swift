//: [Previous](@previous)

import Foundation

// const vs var
let const = 10
var variable = 10
// compiler error - 常數指定後就不能更動
//const = 15
variable = 15

// Explicit Types
let cInt: Int = Int(1)
let cInt2: Int = Int.init(2)

// Type Inference
let cInt3: Int = .init(5)
let cInt4 = 50 // 整數預設給Int
print(type(of: cInt4))
let cDouble = 30.5 // 浮點數預設double
print(type(of: cDouble))
let str = "abc"
print(type(of: str))
let iTrue = true
print(type(of: iTrue))

// Type Safety
var vInt = 10
//vInt = "abc" // complier error - 型態不一致

// 如果不確定型態, 可以透過Any做轉換, 但Any在操作上非常不便
var any: Any = 0
any = "abc"
print(any)

// optional
//var aNil: Int = nil
