//
//  Data Model.swift
//  PlaySathi
//
//  Created by Batch - 2 on 15/01/25.
//

import Foundation
import UIKit


struct User {
    var id: UUID
    var name: String
    var profilePicture: String
    var elitePoints: Int
    var skillLevel: SkillLevel
    var distance: Double
    var location : String
    
}

enum SkillLevel: String {
        case beginner = "Beginner"
        case intermediate = "Intermediate"
        case advanced = "Advanced"
}

struct Venue {
    let id: UUID
    var name: String
    var imageUrl: String
    var rating: Double
    var distanceInKm: Double
    var location: String
    var numberOfCourts: Int
    var price : Int
    var amenities: [String]
    var openingTime : String
    var closingTime : String
    
}

var homeScreenSections: Int = 3


struct SlotBookings {
    var preferedDate : String
    var startTime : String
    var numberofPlayingHours : Int
}


struct GameCreation {
    var title:String
    var type : TypeofGame
    var player : User
    var venue: Venue
}

enum TypeofGame: String {
    case singles
    case doubles
}


struct Match{
    var id : UUID
    var game : GameCreation
}


class ScreenNavigation{
    static let navigate = ScreenNavigation()
    var check : String?
}
