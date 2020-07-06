//
//  RealWorldCrap.swift
//  Algo
//
//  Created by Jerry Ren on 7/4/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit

class FriendsTVSeries {
    
    fileprivate func hangOut(people: [MainCharactersName]) {
        var scene: String = ""
        for individual in people {
            scene.append("\(individual) and ")
        }
        let leng = scene.count
        scene = String(scene.prefix(leng - 4))
        scene.append("are hanging out")
        print(scene)
    }
    
    var episodeNumber: Int
    var seasonNumber: Int
    
    init(episodeNumber: Int, seasonNumber:Int) {
        self.episodeNumber = episodeNumber
        self.seasonNumber = seasonNumber
    }

    enum SignificantLocations {
        case CentralPerkCoffeHouse
        case MonicaAndRachelsApartment
        case ChandlerAndJoeysApartment
    }
}

struct FriendsMainCharacter {
    var name: MainCharactersName
    var age: Int
    var birthday: Date
    var personality: PersonalityType
    var currentSpouse: String?
    var datingHistory: [SupportingCharacter]
}

enum MainCharactersName {
    case Joey
    case Chandler
    case Phoebe
    case Rachel
    case Ross
    case Monica
}

struct SupportingCharacter {
    var characterName: String
    var personality: PersonalityType
    init(characterName: String, personality: PersonalityType) {
        self.characterName = characterName
        self.personality = personality
    }
}

enum PersonalityType {
    case INFP
    case INTP
    case INFJ
    case INTJ
    case ENTJ
    case ENFJ
    case ENFP
    case ENTP
    case ESTP
    case ESFP
    case ESFJ
    case EFTJ
    case ISTJ
    case ISFJ
    case ISFP
    case ISTP
}
     
let friendz = FriendsTVSeries.init(episodeNumber: 11, seasonNumber: 6)
let crew = friendz.hangOut(people: [.Chandler, .Phoebe, .Joey])

      

        

// MARK: - random.rand enum

enum CompassPoint {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}
var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
let expressionsNotAllowedAtTopLevel = currentDirection.turnNorth()

// MARK: - NYC (perhaps dead-end)

class NewYorkCity {
    
    var districts: Boroughs = Boroughs.init()
    
    var nicknames: Array<String>
        = ["The Big Apple", "The City That Never Sleeps", "Empire City", "Gotham", "The Melting Pot"]
    
    var bridges: [String] = GloballyUsed.nycBridges
    // what kinda behaviors / functions can I write for NYC?  Darn it! It's not an animal or a character
}
                  
struct Boroughs {
    let Manhattan: String = "Manhattan"
    let Brooklyn: String = "Brooklyn"
    let Bronx: String = "Bronx"
    let Queens: String = "Queens"
    let StatenIsland: String = "Staten Island"
}

struct SightSeeing {
    let traditionalSpots = ["Central Park", "World Trade Center", "Statue of Liberty", "Metropolitan Museum", "Times Square", "Rockefeller Center", "New York Public Library", "Grand Central Terminal"]
    
    let lessKnownSpots = ["MOMA", "East Village", "Madison Square Garden","Coney Island Amusement Park", "Friends' Apartment", "Roosevelt Island Aerial Tram", "Rockaway Beach", "Hudson Yards", "Bronx Zoo", "Governor's Island"]
}
         
struct GloballyUsed {
    
    static let nycBridges: [String] = ["Williamsburg Bridge", "George Washington Bridge","Manhattan Bridge", "Henry Hudson Bridge", "Queensboro Bridge", "Bronx-Whitestone Bridge", "Brooklyn Bridge"]
}
 
