//: [Previous](@previous)

import Foundation

// non-optional variables
var aInt: Int = 100
// compiler error
//aInt = nil

// compiler error = 資料型態無法確認, 無法Type Inference
// var abc = nil

// optional 宣告方式
var oI: Optional<Int>
var oIq: Int?
var oIe: Int!

// optional with question mark
var qInt: Int?
print(qInt)

// optional with exclamation mark
var eInt: Int! = nil
print(eInt)

// 強制存取
var qName: String?
// runtime error
//print(qName!)

qName = "Stanley"
// compiler error - optional不可以直接操作
//let hQString = "Hello" + qName
if qName != nil {
    let hQString = "Hello," + qName!
    print(hQString)
}

var eString: String!
// runtime error
//print(eString.count)
eString = "Stanley"
let hEString = "Hello," + eString
print(hEString)

// optional chain
var chString: String?
print(chString?.data(using: .utf8)?.count)
chString = "abc"
print(chString?.data(using: .utf8)?.count)

// optional binding
print("optional binding")
var bindString: String?
if let bindString = bindString {
    print("is nil = \(bindString)")
}
if var bindString = bindString {
    bindString += "abcc"
}
bindString = ""
if let bindString = bindString {
    print(bindString.count)
}
bindString = "abc"
if let bindString = bindString {
    print(bindString.count)
}

func checkString(str: String?) {
    guard let str = str else {
        print("str is nil")
        return
    }
    print(str.count)
}

var gBindString: String?
checkString(str: gBindString)
gBindString = ""
checkString(str: gBindString)
gBindString = "binding"
checkString(str: gBindString)
