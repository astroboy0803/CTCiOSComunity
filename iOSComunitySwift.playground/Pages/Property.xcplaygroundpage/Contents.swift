//: [Previous](@previous)

import Foundation

// Store property

// Compute property

// Property Wrapper - 屬性包裝器
@propertyWrapper
struct TwelveOrLess {
    private var value: Int
    init() {
        value = .zero
    }
    var wrappedValue: Int {
        get {
            value
        }
        set {
            value = min(newValue, 12)
        }
    }
}

// 一般寫法
struct SmallRectangle2 {
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()
    var height: Int {
        get { return _height.wrappedValue }
        set { _height.wrappedValue = newValue }
    }
    var width: Int {
        get { return _width.wrappedValue }
        set { _width.wrappedValue = newValue }
    }
}
var rectangle2 = SmallRectangle2()
print(rectangle2.height)

rectangle2.height = 10
print(rectangle2.height)

rectangle2.height = 60
print(rectangle2.height)

// property wrappers - compiler轉換回一般寫法
struct SmallRectangle {
    @TwelveOrLess var width: Int
    @TwelveOrLess var height: Int
}

var rectangle = SmallRectangle()
print(rectangle.height)

rectangle.height = 10
print(rectangle.height)

rectangle.height = 60
print(rectangle.height)
