import Foundation

public func runSet() {
    // Set
    // compiler error
    //let anySet: Set<Any> = .init()
    //let anyObjSet: Set<AnyObject> = .init()

    // Create and Initialize
    let set1: Set<Int> = .init()
    let set2 = Set([1, 5, 6, 9, 25, 1, 5, 669, 2])
    let set3: Set<Int> = [1, 5, 6, 9, 25, 1, 5, 669, 2]

    print(set3)
    print(type(of: set3))
    let aryNotSet = [1, 5, 6, 9, 25, 1, 5, 669, 2]
    print(type(of: aryNotSet))

    // Add and Remove
    var strNumSet: Set<String> = []
    strNumSet.insert("One")
    print(strNumSet)
    strNumSet.insert("Two")
    print(strNumSet)
    let insResult = strNumSet.insert("One") // It's ignore because the item is duplicate
    print(insResult.inserted)

    if let rOne = strNumSet.remove("One") {
        print(rOne)
    }
    print(strNumSet)
    strNumSet.removeAll()
    print(strNumSet)


    // Methods
    let mSet: Set<String> = ["One", "Two", "Three"]
    print(mSet.isEmpty)
    print(mSet.count)
    print(mSet.contains("One"))

    // Iterating
    for ele in mSet {
        print(ele)
    }

    // Operations-集合操作
    var opSet1: Set<String> = ["One", "Two", "Three", "abc"]
    var opSet2: Set<String> = ["abc", "def", "ghi", "One"]

    var setUnion = opSet1.union(opSet2)
    print(setUnion)
    print(opSet1)
    opSet1.formUnion(opSet2)
    print(opSet1)

    opSet1 = ["One", "Two", "Three", "abc"] // recover
    let setSubtracting = opSet1.subtracting(opSet2)
    print(setSubtracting)
    print(opSet1)
    opSet1.subtract(opSet2)
    print(opSet1)

    opSet1 = ["One", "Two", "Three", "abc"] // recover
    let setIntersection = opSet1.intersection(opSet2)
    print(setIntersection)
    print(opSet1)
    opSet1.formIntersection(opSet2)
    print(opSet1)

    opSet1 = ["One", "Two", "Three", "abc"] // recover
    let setExclusiveOr = opSet1.symmetricDifference(opSet2)
    print(setExclusiveOr)
    print(opSet1)
    opSet1.formSymmetricDifference(opSet2)
    print(opSet1)

    // 先判斷contain效能比直接insert好
    // Xcode 13.4.1目前測試兩個效能差不多(insert還比較好一點)
    var set: Set<String> = ["A", "B", "C"]
    let startTime = CFAbsoluteTimeGetCurrent()
    for _ in 0..<1000 {
        if set.contains("A") {
            
        }
    }
    let interval = CFAbsoluteTimeGetCurrent() - startTime
    print(">>>> \(interval * 1000)")

    let startTime2 = CFAbsoluteTimeGetCurrent()
    for _ in 0..<1000 {
        set.insert("A")
    }
    let interval2 = CFAbsoluteTimeGetCurrent() - startTime2
    print(">>>> \(interval2 * 1000)")
}
