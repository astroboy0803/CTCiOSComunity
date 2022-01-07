import Foundation

// ARC Working
var class1ref1: MyClass? = MyClass(name: "One")
var class2ref1: MyClass? = MyClass(name: "Two")
var class2ref2: MyClass? = class2ref1

print(">>> Setting class1ref1 to nil")
class1ref1 = nil

print(">>> Setting class2ref1 to nil")
class2ref1 = nil

print(">>> Setting class2ref2 to nil")
class2ref2 = nil

// Strong Reference Cycle
func StrongReferenceCycle() {
    var MyStrong1: MyStrongClass1? = MyStrongClass1(name: "StrongClass1")
    var MyStrong2: MyStrongClass2? = MyStrongClass2(name: "StrongClass2")
    MyStrong1?.strongClass2 = MyStrong2
    MyStrong2?.strongClass1 = MyStrong1
    print(">>> Setting Strong1 and Strong2 to nil")
    MyStrong1 = nil
    MyStrong2 = nil
}
StrongReferenceCycle()

// Unowned
func UnownedReference() {
    let unownedClass2: MyUnownedClass2 = MyUnownedClass2(name: "UnownedClass2")
    let unownedClass1: MyUnownedClass1? = MyUnownedClass1(name: "UnownedClass1", unownedClass2: unownedClass2)
    unownedClass2.unownedClass1 = unownedClass1
    print(">>> OwnedClasses go out of scope")
}
UnownedReference()

// weak
func WeakReference() {
    let weakClass1: MyWeakClass1? = MyWeakClass1(name: "WeakClass1")
    let weakClass2: MyWeakClass2? = MyWeakClass2(name: "WeakClass2")
    weakClass1?.weakClass2 = weakClass2
    weakClass2?.weakClass1 = weakClass1
    print("WeakClasses go out of scope")
}
WeakReference()

// unowned & weak不會增加rc, 直接init = 直接回收
weak var cls: MyClass? = .init(name: "abc")
print(cls)
