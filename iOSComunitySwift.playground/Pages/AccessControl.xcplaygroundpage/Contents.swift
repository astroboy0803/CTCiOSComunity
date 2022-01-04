//: [Previous](@previous)

import Foundation
import Darwin

// public不能subclass
//public class NewPClass: PClass {
//
//}

open class NewOClass: OClass {
    
    override init() {
        super.init()
    }
    
    override open func execute() {
        super.execute()
        print("I'm NewOClass execute...")
    }
    
    // public method 不可以被override
//    override public func run() {
//        super.run()
//        print("I'm NewOClass run...")
//    }
}

let instance = NewOClass()
instance.execute()
instance.run()
