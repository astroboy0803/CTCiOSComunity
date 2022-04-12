import Foundation

class CacheSample: NSObject {
    enum LimitType {
        case count(value: Int)
        case memory(value: Int)
    }
    
    let cache: NSCache<AnyObject, AnyObject>
    init(type: LimitType) {
        cache = .init()
        super.init()
        
        switch type {
        case let .count(value):
            cache.countLimit = value
        case let .memory(value):
            cache.totalCostLimit = value
        }
        cache.delegate = self
    }
}

extension CacheSample: NSCacheDelegate {
    func cache(_ cache: NSCache<AnyObject, AnyObject>, willEvictObject obj: Any) {
        print(obj)
    }
}

let cntCache = CacheSample(type: .count(value: 3))
for idx in 1...10 {
    cntCache.cache.setObject("\(idx)" as AnyObject, forKey: idx as AnyObject)
    cntCache.cache.setObject("100" as AnyObject, forKey: 100 as AnyObject)
}
cntCache.cache.setObject("101" as AnyObject, forKey: 101 as AnyObject)
cntCache.cache.setObject("102" as AnyObject, forKey: 102 as AnyObject)
print(">>>> total limit")
let totalCache = CacheSample(type: .memory(value: 100)) // 記憶體只能佔100byte
for idx in 1...10 {
    totalCache.cache.setObject("\(idx)" as AnyObject, forKey: idx as AnyObject, cost: 5) // 5byte
    totalCache.cache.setObject("100" as AnyObject, forKey: 100 as AnyObject, cost: 80) // 80byte
    // 5 * 10 + 80 = 130
    // 130 - 100 = 30
    // 30 / 5 = 6 -> 1 2 3 4 5 6 
}
