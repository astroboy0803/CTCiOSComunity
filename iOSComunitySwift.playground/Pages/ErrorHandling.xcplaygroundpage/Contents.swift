//: [Previous](@previous)

import Foundation

// create error
enum MyError: Error {
    case Minor
    case Bad
    case Terrible(description: String)
}
// throw MyError.Bad

enum PlayerNumberError: Error {
    case NumberTooHigh(description: String)
    case NumberTooLow(description: String)
    case NumberAlreadyAssigned
    case NumberDoseNotExist
}

typealias BaseballPlayer = (firstName: String, lastName: String, number: Int)

// throw and throws
struct BaseballTeam {
    private var players = [Int: BaseballPlayer]()
    private let maxNumber = 99
    private let minNumber = 0

    mutating func addPlayer(player: BaseballPlayer) throws {
        guard player.number < maxNumber else {
            throw PlayerNumberError.NumberTooHigh(description: "max number is \(maxNumber)")
        }
        guard player.number > minNumber else {
            throw PlayerNumberError.NumberTooLow(description: "min number is \(minNumber)")
        }
        guard players[player.number] == nil else {
            throw PlayerNumberError.NumberAlreadyAssigned
        }
        players[player.number] = player
    }

    func getPlayerByNumber(number: Int) throws -> BaseballPlayer {
        if let player = players[number] {
            return player
        }
        throw PlayerNumberError.NumberDoseNotExist
    }
}

var myTeam = BaseballTeam()

// do-catch
do {
    let player = try myTeam.getPlayerByNumber(number: 37)
    print("Player is \(player.firstName) \(player.lastName)")
} catch PlayerNumberError.NumberDoseNotExist {
    print("No Player has that Number")
} catch _ {
    // pattern empyt or underscore match all error
    print("Unknown Errors")
}

do {
    try myTeam.addPlayer(player: ("David", "Ortiz", 34))
} catch let PlayerNumberError.NumberTooHigh(description) {
    print("Error : \(description)")
} catch let PlayerNumberError.NumberTooLow(description) {
    print("Error : \(description)")
} catch PlayerNumberError.NumberAlreadyAssigned {
    print("Error : number already assigned")
} catch {
    print("Error : Unknown Error \(error)")
}

do {
    let player = try myTeam.getPlayerByNumber(number: 34)
    print("Player is \(player.firstName) \(player.lastName)")
} catch PlayerNumberError.NumberDoseNotExist {
    print("No Player has that Number")
}

// error propagate
func myFunc() throws {
    try myTeam.addPlayer(player: ("David", "Ortiz", 34))
}

do {
    try myFunc()
} catch let PlayerNumberError.NumberTooHigh(description) {
    print("Error : \(description)")
} catch let PlayerNumberError.NumberTooLow(description) {
    print("Error : \(description)")
} catch PlayerNumberError.NumberAlreadyAssigned {
    print("Error : number already assigned")
} catch {
    print("Error : Unknown Error")
}

// error(did you mean to disable error propagation) > ??????method??????????????????try??????
// myTeam.addPlayer(player: ("J.D","Martinez",14))

// forced-try > ?????????????????????????????????????????????
try! myTeam.addPlayer(player: ("J.D", "Martinez", 14))

// not catch block is empty
if let player = try? myTeam.getPlayerByNumber(number: 30) {
    print("Player is \(player.firstName) \(player.lastName)")
}

// defer > ????????????,???method??????????????????????????????????????? > instead of finally
func deferFunction() {
    print("Function Started")
    var str: String?
    defer {
        print("In defer block")
        if let s = str {
            print("str is \(s)")
        }
    }
    // ??????defer??????????????? > ??????defer?????????block??????????????????
    str = "John"
    print("Function Finished")
    
    defer {
        print("adfad")
    }
}

deferFunction()

// availability attribute - if/esle
if #available(iOS 9.0, OSX 10.10, watchOS 2, *) {
    print("Minimum requirements met")
} else {
    print("Minimum requirements not met")
}

// availability attribute - restrict
@available(iOS 9.0, *)
func testAvailability() {
    // Function only for iOS 9 or above
}

@available(iOS 9.0, *)
struct TestStruct {
    // Struct only for iOS 9 or above
}

