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
let strEmpty = ""
print("strHello == strWorld = \(strHello == strWorld)")
print("strEmpty is Empty = \(strEmpty.isEmpty)")
print("strHello is Empty = \(strHello.isEmpty)")
print("strHello is hasPrefix = \(strHello.hasPrefix("Hello"))")
print("strHello is hasPrefix = \(strHello.hasPrefix("hello"))")
print("strHello is hasSuffix = \(strHello.hasSuffix("World"))")
print("strHello is hasSuffix = \(strHello.hasSuffix("world"))")

// replace
let strReplace = "one,to,three,four, to"
let newStrReplace = strReplace.replacingOccurrences(of: "to", with: "two")
print("to replace two = \(newStrReplace)")

// 字串切割
let splits = strReplace.split(separator: ",")
print(type(of: splits))
let components = strReplace.components(separatedBy: ",")
print(type(of: components))

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

// string深入研究

// string與code point互轉
let uniString = "\u{1F30A}"
print("unistring = \(uniString)")
let uniString2 = "\u{8702}\u{871c}\u{6ab8}\u{6aac}"
print("unistring2 = \(uniString2)")

// unicodeScalars是由Unicode.Scalar組成的collection
// 每個Unicode.Scalar就代表一個code point, 但不包含Surrogate Pairs用的 Code Point
for code in uniString2.unicodeScalars {
    print("value = \(code.value), hex = \(String(code.value, radix: 16).uppercased())")
}

// swift支援不同編碼的code unit, 長度就會有所不同
let snowboardCostYen = "🏂 costs ￥"
print(snowboardCostYen.unicodeScalars.count)
print(snowboardCostYen.utf16.count)
print(snowboardCostYen.utf8.count)

// 使用一個以上的code point組成新的character: Grapheme Cluster
let eChar = "\u{65}"
let emphasis = "\u{301}"
let combine = "\u{65}\u{301}"
let enclose = "A\u{20DD}\u{301}"

let first = "\u{1112}"
let second = "\u{1161}"
let third = "\u{11AB}"
let cluster = "\u{1112}\u{1161}\u{11AB}"

var zalgo = "Z̫̫̳̰̦͙͙̒̇̽̒͗̑̂̋̚ạ͈̳̟̙͉̥̦̙̒̔̃͋̅͛̐l͕̯̟͖̣͊̓̒̂̑̽̊̃͑̃̓̽ḡ̟̲͚̞͆͊̋̏̽̏̉ͅô̤͈̩̖̞̙̲͚͍͓̘͉͂́̆"
for code in zalgo.unicodeScalars {
    print(code)
}

// string count != code point count
print("cluster count = \(cluster.count), code point count = \(cluster.unicodeScalars.count)")
print("enclose count = \(enclose.count), code point count = \(enclose.unicodeScalars.count)")
print("zalgo count = \(zalgo.count), code point count = \(zalgo.unicodeScalars.count)")

// character的code point是不固定, 所以swift無法直接用random access方式存取string中的character
// 必須使用string index複雜的方式來讀取
let head = snowboardCostYen.index(snowboardCostYen.startIndex, offsetBy: 2)
let tail = snowboardCostYen.index(snowboardCostYen.endIndex, offsetBy: -2)

// substring - 加強string效能
let costsSubstring = snowboardCostYen[head..<tail]

// string比較 - 以character不是code point
let acute1 = "\u{E9}"
let acute2 = "\u{65}\u{301}"
print(acute1 == acute2)

let latinA = "\u{41}" // 英語的A
let cyrillicA = "\u{0410}" // 俄語的A
print(latinA == cyrillicA)

// Copy on Write - 當資料改變才會真的配置新的記憶體空間，在沒變動時，都是共用同一個記憶體區塊
let strA = "String A"
var strB = strA
print(Unmanaged.passUnretained(strA as AnyObject).toOpaque())
print(Unmanaged.passUnretained(strB as AnyObject).toOpaque())

strB += "B"
print(Unmanaged.passUnretained(strB as AnyObject).toOpaque())
