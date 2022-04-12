import Foundation

//reference: https://davidlinnn.medium.com/type-erasure-1c74ba7130d5

// Pokemon 為可以使出各種特殊招式的奇妙生物
protocol Pokemon {
    // Power 為他的屬性
    associatedtype Power
    // 可以發出攻擊，並且此攻擊招式附帶 Power 屬性
    func attack() -> Power
}

// Power 的型態宣告
struct 🔥 { }
struct 🌩 { }

struct 皮卡丘: Pokemon {
    func attack() -> 🌩 {
        return 🌩()
    }
}

struct 小火龍: Pokemon {
    func attack() -> 🔥 {
        return 🔥()
    }
}

// 我們想要有一個神奇寶貝農場
//let pokemonRanch: [Pokemon] = []
// error: protocol 'Pokemon' can only be used as a generic constraint because it has Self or associated type requirements

// 沒有使用泛型的protocol可以做為資料型態的一種, 反之, 因不確定你是何種類型而不行(如上)
protocol TTT {
    func ttt()
}
let ttts: [TTT] = [] // ok

// Type erasure
struct AnyPokemon<Power>: Pokemon {
    
    private let _attack: () -> Power
    
    init<P: Pokemon>(_ pokemon: P) where P.Power == Power {
        _attack = pokemon.attack
    }
    
    func attack() -> Power {
        _attack()
    }
}

// 保留原本型態
let elePokemonRanch: [皮卡丘] = []
let firePokemonRanch: [小火龍] = []

// 把原本型態隱藏而變成AnyPokemon instance
let fireRanch: [AnyPokemon<🔥>] = [.init(小火龍())]
let eleRanch: [AnyPokemon<🌩>] = [.init(皮卡丘())]

// 已除去原本型態, 故無法轉回原本型態, 故無法使用自有的方法
let fireAnypoke = fireRanch[0]
let isFire = fireAnypoke is 小火龍

let strSequence = AnySequence(["a", "b"])
for str in strSequence {
    print(str)
}
