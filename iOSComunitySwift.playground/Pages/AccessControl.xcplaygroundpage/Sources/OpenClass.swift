import Foundation

// 檔案不同, 無法讀取到fileprivate
//public class AClass: MyClass {
//
//}

public class PClass {
    func execute() {
        print("I'm PClass...")
    }
}

open class OClass {
    
    open init() {
        
    }
    
    public func run() {
        print("I'm OClass run...")
    }
    open func execute() {
        print("I'm OClass execute...")
    }
}
