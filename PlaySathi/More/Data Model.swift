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
    var skillLevel : String = "Beginner"
    var elitePoint: Int8 = 0
    var gender : String = "Male"
    
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
    var courtAvailability: [String: [String]]
    
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

struct CourtAvailability {
    let courtId: String
    var availableTimeSlots: [String]
}

var listOfSections:[TypeOfSection] = [.createGame,.player,.venue]
