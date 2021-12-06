//: [Previous](@previous)

import Foundation
import Darwin

// Store property

// Compute property

// Property Wrapper

//未使用property wrapper
struct TwelveOrLessRanctangle {
    private var _height: Int = .zero
    private var _weight: Int = .zero
    public var height: Int {
        get {
            _height
        }
        set {
            _height = min(newValue, 12)
        }
    }
    public var weight: Int {
        get {
            _weight
        }
        set {
            _weight = min(newValue, 12)
        }
    }
}

// create Property Wrapper
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

// 一般寫法 - 自行建立資料型態
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

// the compiler synthesizes code
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

// 設定初始值
@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int
    
    var wrappedValue: Int {
        get {
            number
        }
        set {
            number = min(newValue, maximum)
        }
    }
    
    init() {
        maximum = 12
        number = .zero
    }
    
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

struct ZeroRectangle {
    @SmallNumber var width: Int
    @SmallNumber var height: Int
}
let zeroRectangle = ZeroRectangle()
print("(\(zeroRectangle.width),\(zeroRectangle.height))")

// 設定初始值後, invoke init(wrappedValue:) = @SmallNumber(wrappedValue:)
struct UnitRectangle {
    @SmallNumber var width: Int = 1
    @SmallNumber var height: Int = 1
}
let unitRectangle = UnitRectangle()
print("(\(unitRectangle.width),\(unitRectangle.height))")

struct NarrowRectangle {
    @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
    @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
}

var narrowRectangle = NarrowRectangle()
print("(\(narrowRectangle.width),\(narrowRectangle.height))")
narrowRectangle.width = 100
narrowRectangle.height = 100
print("(\(narrowRectangle.width),\(narrowRectangle.height))")

struct MixRectangle {
    @SmallNumber(maximum: 9) var width: Int = 2
    @SmallNumber var height: Int = 1
}
var mixRectangle = MixRectangle()
print("(\(mixRectangle.width),\(mixRectangle.height))")
mixRectangle.height = 20
mixRectangle.width = 20
print("(\(mixRectangle.width),\(mixRectangle.height))")

// Project Value - 無法定義$開頭的屬性, 故不會被其它干擾
@propertyWrapper
struct Small2Number {
    private var number: Int
    private(set) var projectedValue: Bool // 變數名稱必須為 projectedValue
    var wrappedValue: Int {
        get {
            number
        }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }
    init() {
        number = .zero
        projectedValue = false
    }
}
struct SomeStructure {
    @Small2Number var someNumber: Int
}
var someStructure = SomeStructure()
someStructure.someNumber = 4
print(someStructure.$someNumber)
someStructure.someNumber = 55
print(someStructure.$someNumber)

enum Size {
    case small, large
}

struct SizedRectangle {
    @Small2Number var height: Int
    @Small2Number var width: Int

    mutating func resize(to size: Size) -> Bool {
        switch size {
        case .small:
            height = 10
            width = 20
        case .large:
            height = 100
            width = 100
        }
        return $height || $width
    }
}
var sizedRectangle = SizedRectangle()
print(sizedRectangle.resize(to: .small))
print(sizedRectangle.resize(to: .large))
