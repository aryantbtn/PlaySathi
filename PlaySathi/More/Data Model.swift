//
//  Data Model.swift
//  PlaySathi
//
//  Created by Batch - 2 on 15/01/25.
//

import Foundation
import UIKit


struct Profile: Codable {
    var id: UUID
    var email: String
    var name: String
    var contactNumber: String
    var playerImage:String
    var location:String
    var availableTime:String
    
    init(id:UUID,email:String,name:String,contactNumber:String,playerImage:String,location:String,availableTime:String){
        self.id = id
        self.email = email
        self.contactNumber = contactNumber
        self.name = name
        self.playerImage = playerImage
        self.location = location
        self.availableTime = availableTime
    }
}

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

struct Achievement {
    var achieveName: String
    var achieveImage: UIImage
    var dateOfAchievement: String
}


struct Venue {
    let id: UUID
    var name: String
    var imageUrl: String
    var rating: Double
    var distanceInKm: Double
    var location: String
    var numberOfCourts: [String]
    var price : Int
    var amenities: [String]
    var openingTime : String
    var closingTime : String
    var timeSlots: [String]
    
}


struct Game {
    var title:String
    var type : TypeofGame
    var player : User
    var venue: Venue
}

enum TypeofGame: String {
    case singles
    case doubles
}

class ScreenNavigation{
    static let navigate = ScreenNavigation()
    var check : String?
}

enum TypeOfSection {
    case player
    case venue
    case createGame
    case inviteSent
    //case requestReceived
    case gameCreated
    case venueBooked
    case matches
}



var listOfSections:[TypeOfSection] = [.createGame,.player,.venue]
