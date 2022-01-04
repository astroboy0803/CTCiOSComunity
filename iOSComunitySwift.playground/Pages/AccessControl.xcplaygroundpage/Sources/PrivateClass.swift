import Foundation

fileprivate class MyClass {
    private class SuperClass {
        // 意義不大, 除MyClass可以操作外, 沒有
        private class SonClass: SuperClass {
            override func execute() {
                
            }
        }
        
        private var value: Int = .zero
        private func execute() {}
    }
    
    internal func execute() {
        //雖然都在MyClass宣告內
        //let son = SuperClass.SonClass()
    }
    
    // principle
//    public func dosomething() {
//
//    }
}

fileprivate class MySonClass: MyClass {
    
}
