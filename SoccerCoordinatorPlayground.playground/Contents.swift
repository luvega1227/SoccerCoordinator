
import UIKit

/// MARK: Collections of Teams & Players

// Dictionary collection of Players
let players: [[String: Any]] = [
    [
        "name": "Joe Smith",
        "height": 42,
        "isExperienced": true,
        "guardians": "Jim and Jan Smith"
    ],
    [
        "name": "Jill Tanner",
        "height": 36,
        "isExperienced": true,
        "guardians": "Clara Tanner"
    ],
    [
        "name": "Bill Bon",
        "height": 43,
        "isExperienced": true,
        "guardians": "Sara and Jenny Bon"
    ],
    [
        "name": "Eva Gordon",
        "height": 45,
        "isExperienced": false,
        "guardians": "Wendy and Mike Gordon"
    ],
    [
        "name": "Matt Gill",
        "height": 40,
        "isExperienced": false,
        "guardians": "Charles and Sylvia Gill"
    ],
    [
        "name": "Kimmy Stein",
        "height": 41,
        "isExperienced": false,
        "guardians": "Bill and Hillary Stein"
    ],
    [
        "name": "Sammy Adams",
        "height": 45,
        "isExperienced": false,
        "guardians": "Jeff Adams"
    ],
    [
        "name": "Karl Saygan",
        "height": 42,
        "isExperienced": true,
        "guardians": "Heather Bledsoe"
    ],
    [
        "name": "Suzane Greenberg",
        "height": 44,
        "isExperienced": true,
        "guardians": "Henrietta Dumas"
    ],
    [
        "name": "Sal Dali",
        "height": 41,
        "isExperienced": false,
        "guardians": "Gala Dali"
    ],
    [
        "name": "Joe Kavalier",
        "height": 39,
        "isExperienced": false,
        "guardians": "Sam and Elaine Kavalier"
    ],
    [
        "name": "Ben Finkelstein",
        "height": 44,
        "isExperienced": false,
        "guardians": "Aaron and Jill Finkelstein"
    ],
    [
        "name": "Diego Soto",
        "height": 41,
        "isExperienced": true,
        "guardians": "Robin and Sarika Soto"
    ],
    [
        "name": "Chloe Alaska",
        "height": 47,
        "isExperienced": false,
        "guardians": "David and Jamie Alaska"
    ],
    [
        "name": "Arnold Willis",
        "height": 43,
        "isExperienced": false,
        "guardians": "Claire Willis"
    ],
    [
        "name": "Phillip Helm",
        "height": 44,
        "isExperienced": true,
        "guardians": "Thomas Helm and Eva Jones"
    ],
    [
        "name": "Les Clay",
        "height": 42,
        "isExperienced": true,
        "guardians": "Wynonna Brown"
    ],
    [
        "name": "Herschel Krustofski",
        "height": 45,
        "isExperienced": true,
        "guardians": "Hyman and Rachel Krustofski"
    ]
]

// Collections of players in Sharks Team
var teamSharks: [[String: Any]] = []

// Collections of players in Dragon Team
var teamDragons: [[String: Any]] = []

// Collection of players in Raptors Team
var teamRaptors: [[String: Any]] = []

/// MARK: Variables & Logic to sort and store players into 3 teams

// Number of teams
let teamCount = [teamSharks, teamDragons, teamRaptors].count

// Collection of letters
var letters: [String] = []

// Function that sorts a collection of players
func sort(_ players: [[String: Any]]) {
    // If the players can be divided equally to each team...
    if players.count % teamCount == 0 {
        // ...sort the players
        
        // Collection of experienced players
        var experiencedPlayers: [[String: Any]] = []
        
        // Collection of inexperienced players
        var inexperiencedPlayers: [[String: Any]] = []
        
        // Loop through the players
        for player in players {
            // If the player is experienced...
            if player["isExperienced"] as! Bool {
                // ...appened player to experiencedPlayers collection
                experiencedPlayers.append(player)
            } else {
                // ...appened player to inexperiencedPlayers collection
                inexperiencedPlayers.append(player)
            }
        }
        
        // Append experienced players to each team evenly
        
        // Loop through experienced players
        for i in 0..<experiencedPlayers.count {
            // Append each players to each team evenly
            if teamSharks.count < experiencedPlayers.count / teamCount {
                teamSharks.append(experiencedPlayers[i])
            } else if teamDragons.count < experiencedPlayers.count / teamCount {
                teamDragons.append(experiencedPlayers[i])
            } else {
                teamRaptors.append(experiencedPlayers[i])
            }
        }
        
        // Append inexperienced players to each team evenly
        
        // Loop through inexperienced players
        for i in 0..<inexperiencedPlayers.count {
            // Append players to each team
            if teamSharks.count < players.count / teamCount {
                teamSharks.append(inexperiencedPlayers[i])
            } else if teamDragons.count < players.count / teamCount {
                teamDragons.append(inexperiencedPlayers[i])
            } else {
                teamRaptors.append(inexperiencedPlayers[i])
            }
        }
    } else {
        // print an error message
        print("ERROR: could not sort teams evenly")
    }
}

/// Returns the average height of a team
func averageHeight(of team: [[String: Any]]) -> Int {
    var totalHeight: Float = 0
    
    for player in team {
        totalHeight += Float(player["height"] as! Int)
    }
    
    return Int((totalHeight / Float(team.count)).rounded(FloatingPointRoundingRule.toNearestOrAwayFromZero))
}

func appendLetters(from team: [[String: Any]], name: String, timing: String) {
    var teamLetters: [String] = []
    
    for player in team {
        let letter = "\nDear \(player["guardians"] as! String):, \n\nCongradulations, \(player["name"] as! String) has been invited to practice with the \(name) Team  on \(timing). \n\nThanks You!"
        
        teamLetters.append(letter)
    }
    letters.append(contentsOf: teamLetters)
}

// Sort players in each team example
sort(players)




