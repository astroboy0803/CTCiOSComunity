import Foundation

// 檔案不同, 無法讀取到fileprivate
//public class AClass: MyClass {
//
//}

open class OClass {
    
    public init() {
        
    }
    
    public func run() {
        print("I'm OClass run...")
    }
    open func execute() {
        print("I'm OClass execute...")
    }
}

public class PClass {
    func execute() {
        print("I'm PClass...")
    }
}
