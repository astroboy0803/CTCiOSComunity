import Foundation

public func runTuple() {
    // Create and Initialize
    var tupTeam = ("Boston", "Red Sox", 97, 65, 59.9)
    var tupTeamDefineVariable = (city: "Boston", name: "Red Sox", wins: 50, loses: 50, percent: 50.0)

    print(type(of: tupTeam))
    print(type(of: tupTeamDefineVariable))

    // Manipulation
    let (city, name, wins, loses, percent) = tupTeam
    print("city = \(city),name = \(name),wins = \(wins),loses = \(loses),percent = \(percent)")
    // compiler error - 常數
    //city = "abc"

    var strCity = tupTeam.0
    var strName = tupTeam.1
    var intWins = tupTeam.2
    var intLoses = tupTeam.3
    var douPercent = tupTeam.4
    print("city = \(strCity),name = \(strName),wins = \(intWins),loses = \(intLoses),percent = \(douPercent)")

    print("city = \(tupTeamDefineVariable.city),name = \(tupTeamDefineVariable.name),wins = \(tupTeamDefineVariable.wins),loses = \(tupTeamDefineVariable.loses),percent = \(tupTeamDefineVariable.percent)")
}
