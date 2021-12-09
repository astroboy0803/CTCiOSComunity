import Foundation

public func runEnumeration() {
    enum Planets {
        case Mercury
        case Venus
        case Earth
        case Mars
        case Jupiter
        case Saturn
        case Uranus
        case Neptune
    }

    enum ShortPlanets {
        case Mercury, Venus, Earth, Mars
        case Jupiter, Saturn, Uranus, Neptune
    }

    let furthestPlant = ShortPlanets.Jupiter

    var planetWeLivingOn: Planets = .Earth
    planetWeLivingOn = .Mars

    // comparsion
    if planetWeLivingOn == .Earth {
        print("Living in Earth")
    } else {
        print("Living in \(planetWeLivingOn)")
    }

    // compiler error - 沒有列出所有case
    //switch furthestPlant {
    //case .Mars:
    //    print("Mars")
    //}

    switch furthestPlant {
    case .Mercury:
        break
    case .Venus:
        print("Venus...")
    case .Earth:
        print("Earth...")
    case .Mars:
        break
    case .Jupiter:
        print("Jupiter...")
    case .Saturn:
        print("Saturn...")
    case .Uranus:
        break
    case .Neptune:
        break
    }

    switch planetWeLivingOn {
    case .Mercury:
        print("Mercury")
    case .Earth:
        print("Earth")
    case .Mars:
        print("Mars")
    default:
        print("default")
    }

    // 定義型別
    enum Devices: String {
        case MusicPlayer = "iPod"
        case Phone = "iPhone"
        case Tablet = "iPad"
    }

    enum IntPlants: Int {
        case Mercury
        case Venus = 2
        case Earth
        case Mars
        case Jupiter
        case Saturn
        case Uranus
        case Neptune
    }

    // compiler error - has no member(要有指定型態才可使用rawValue)
    // print(planetWeLivingOn.rawValue)
    print("We are using an \(Devices.Tablet.rawValue)")
    print("Earth is planet number \(IntPlants.Earth.rawValue)")
    if let numPlant = IntPlants(rawValue: 0) {
        print("the plant is \(numPlant)")
    }

    // associated value
    enum Product {
        case Book(Double, Int, Int)
        case Puzzle(Double, Int)
    }
    var pBook = Product.Book(49.99, 2017, 310)
    switch pBook {
    case let .Book(price, year, pages):
        print("Mastering Swift was published in \(year) for the price of \(price)and has \(pages) pages")
    case .Puzzle(let price, let pieces):
        print("Mastering Swift is a puzzle with \(pieces) and sells for \(price)")
    }

    var pPuzzle = Product.Puzzle(9.99, 200)
    switch pPuzzle {
    case var .Book(price, year, pages):
        year += 100
        price += 2
        pages += 6
        print("World Puzzle was published in \(year) for the price of \(price) and has \(pages) pages")
    case .Puzzle(let price, var pieces):
        // compiler error: 常數不可更改
        //price += 100
        pieces -= 50
        print("World Puzzle is a puzzle with \(pieces) and sells for \(price)")
    }

    enum NewProduct {
        case Book(price: Double, year: Int, pages: Int)
        case Puzzle(price: Double, pieces: Int)
    }
    let nBook: NewProduct = .Book(price: 100, year: 2000, pages: 650)
    switch nBook {
    case let .Book(price, year, pages):
        print("World Puzzle was published in \(year) for the price of \(price) and has \(pages) pages")
    case let .Puzzle(price, pieces):
        print("World Puzzle is a puzzle with \(pieces) and sells for \(price)")
    }

    // 不可混用
    // compiler error - associated value就不能設定型態
    //enum BProduct: String {
    //    case Book
    //    case Puzzle(Double, Int)
    //}
}
