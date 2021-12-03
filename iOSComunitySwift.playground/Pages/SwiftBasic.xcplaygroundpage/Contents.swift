//: [Previous](@previous)

import Foundation

// 整數
print("Int 範圍 = \(Int.min) - \(Int.max)")
print("Int64 範圍 = \(Int64.min) - \(Int64.max)")
print("Int32 範圍 = \(Int32.min) - \(Int32.max)")
print("Int16 範圍 = \(Int16.min) - \(Int16.max)")
print("Int8 範圍 = \(Int8.min) - \(Int8.max)")

print("UInt 範圍 = \(UInt.min) - \(UInt.max)")
print("UInt64 範圍 = \(UInt64.min) - \(UInt64.max)")
print("UInt32 範圍 = \(UInt32.min) - \(UInt32.max)")
print("UInt16 範圍 = \(UInt16.min) - \(UInt16.max)")
print("UInt8 範圍 = \(UInt8.min) - \(UInt8.max)")

// 其它進制
let bin = 0b1101
let oct = 0o13
let hex = 0xFF
print(bin)
print(oct)
print(hex)

// 浮點數
print("Float 範圍 = \(-Float.greatestFiniteMagnitude) - \(Float.greatestFiniteMagnitude)")
print("Double 範圍 = \(-Double.greatestFiniteMagnitude) - \(Double.greatestFiniteMagnitude)")

// double較精確
let fValue: Float = 0.111_111_111 + 0.222_222_222
let dValue: Double = 0.111_111_111 + 0.222_222_222

// underscore會被compiler忽略，想怎麼切都可以
let iUnderscore = 3_000_000
print(iUnderscore)
let fUnderscore = 10_0.250_1346_578_913
print(fUnderscore)

let iValue = 160

// compiler error: 型態不同, 不可直接運算
//print(iValue + fValue)
//print(fValue * dValue)

// 轉成相同型態
let fIvalue: Double = Double(iValue)
print(fIvalue - dValue)

// String - 單行, 多行
let str = "Swift is very cool"
var multiLine = """
this is a multiLine string. This show how we can create a string over multiple lines.
Jon says,"multiLine string literals are cool"
"""

// 逐字讀取
var strHello = "Hello"
for char in strHello {
    print(char)
}

// 字串相加
let strWorld = "World"
strHello += strWorld
print("(strHello += strWorld) = \(strHello)")
let strSwiftHW = "Swift \(strHello)"
print("Swift \\(strHello) = \(strSwiftHW)")

// some method or property
print("strHello.uppercased = \(strHello.uppercased())")
print("strHello.lowercased = \(strHello.lowercased())")
var strEmpty = ""
print("strHello == strWorld = \(strHello == strWorld)")
print("strEmpty is Empty = \(strEmpty.isEmpty)")
print("strHello is Empty = \(strHello.isEmpty)")
print("strHello is hasPrefix = \(strHello.hasPrefix("Hello"))")
print("strHello is hasPrefix = \(strHello.hasPrefix("hello"))")
print("strHello is hasSuffix = \(strHello.hasSuffix("World"))")
print("strHello is hasSuffix = \(strHello.hasSuffix("world"))")

// replace
var strReplace = "one,to,three,four, to"
let newStrReplace = strReplace.replacingOccurrences(of: "to", with: "two")
print("to replace two = \(newStrReplace)")

// substring
var strPath = "/one/two/three/four"
//deprecated
//strPath.substring(to: startIdx)
//strPath.substring(from: endIdx)

let startIdx = strPath.index(strPath.startIndex, offsetBy: 4)
let endIdx = strPath.index(strPath.startIndex, offsetBy: 14)
let strP = strPath[startIdx ..< endIdx] // substring type
let strNewPath = String(strP)
print("strNewPath first = \(String(describing: strNewPath.first))")
print("strNewPath last = \(String(describing: strNewPath.last))")
print("strNewPath count = \(strNewPath.count)")
