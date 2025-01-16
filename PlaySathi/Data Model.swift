//
//  Data Model.swift
//  PlaySathi
//
//  Created by Batch - 2 on 15/01/25.
//

import Foundation

struct User {
    let id: Int //UUID
    var name: String
    var profilePicture: String
    var elitePoints: Int
    var skillLevel: SkillLevel
    var location: Double
    

    enum SkillLevel: String {
        case beginner = "Beginner"
        case intermediate = "Intermediate"
        case advanced = "Advanced"
    }
}
class ScreenData{
    static var userData: [User] = [
        User(id: 4, name: "Alok Kumar", profilePicture: "Image 4", elitePoints: 2, skillLevel: .advanced, location: 3.2),
        User(id: 5, name: "Umesh Gaur", profilePicture: "Image 1", elitePoints: 1, skillLevel: .beginner, location: 4),
        User(id: 6, name: "Rishabh Rathore", profilePicture: "Image 2", elitePoints: 1, skillLevel: .beginner, location: 7.4),
        User(id: 7, name: "Rohit Dixit", profilePicture: "Image 3", elitePoints: 1, skillLevel: .beginner, location: 9),
        User(id: 8, name: "Ankit Mishra", profilePicture: "Image", elitePoints: 1, skillLevel: .beginner, location: 10.7),
    ]
    
    static var venueData: [Venue] = [
        Venue(id: 1, name: "Say No To Stress", imageUrl: "V1", rating: 4.0, distanceInKm: 5, location: "Noida", availableCourts: 4),
        Venue(id: 2, name: "Say Sports", imageUrl: "V2", rating: 4.0, distanceInKm: 5, location: "Noida", availableCourts: 4),
        Venue(id: 3, name: "CrowdFit Academy", imageUrl: "V3", rating: 4.0, distanceInKm: 5, location: "Noida", availableCourts: 4),
        Venue(id: 4, name: "Piyush Verma", imageUrl: "V4", rating: 4.0, distanceInKm: 5, location: "Noida", availableCourts: 4),
        
    ]
    
    
    static var sectionHeaderNames:[String] = [
        "",
        "Nearby Players",
        "Venue Near Me"
    ]
}



struct Venue {
    let id: Int //UUID
    var name: String
    var imageUrl: String
    var rating: Double
    var distanceInKm: Double
    var location: String
    var availableCourts: Int
   // var amenities: [Facility]

//    enum Facility: String {
//        case parking = "Parking"
//        case changingRooms = "Changing Rooms"
//        case cafeteria = "Cafeteria"
//        case shower = "Shower"
//    }
}


struct Match: Identifiable {
    let id: UUID
    var players: [User]
    var venue: Venue
    var scheduledTime: Date
    var status: MatchStatus
    var stats: MatchStats?

    enum MatchStatus: String {
        case upcoming = "Upcoming"
        case completed = "Completed"
        case cancelled = "Cancelled"
    }
}


struct MatchStats {
    var winner: User
    var score: String
    var matchDuration: TimeInterval
}


struct ElitePoints {
    let user: User
    var pointsEarned: Int
    var pointsUsed: Int

    func totalPoints() -> Int {
        return user.elitePoints
    }
}
