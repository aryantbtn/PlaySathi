//
//  Data Model.swift
//  PlaySathi
//
//  Created by Batch - 2 on 15/01/25.
//

import Foundation
import UIKit

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
        User(id: 10, name: "Amitabh", profilePicture: "images6", elitePoints: 2, skillLevel: .advanced, location: 25),
        User(id: 11, name: "Shubham", profilePicture: "images7", elitePoints: 2, skillLevel: .advanced, location: 30),
        User(id: 12, name: "Shivam", profilePicture: "images8", elitePoints: 2, skillLevel: .advanced, location: 35),
        User(id: 13, name: "Kunal", profilePicture: "images9", elitePoints: 2, skillLevel: .advanced, location: 40),
        User(id: 14, name: "Vishal", profilePicture: "images10", elitePoints: 2, skillLevel: .advanced, location: 45),
        User(id: 15, name: "Jatin", profilePicture: "images11", elitePoints: 2, skillLevel: .advanced, location: 50),
        User(id: 16, name: "Amit", profilePicture: "images12", elitePoints: 2, skillLevel: .advanced, location: 55),
        User(id: 4, name: "Alok Kumar", profilePicture: "images4", elitePoints: 2, skillLevel: .advanced, location: 3.2),
        User(id: 5, name: "Umesh Gaur", profilePicture: "images1", elitePoints: 1, skillLevel: .beginner, location: 4),
        User(id: 6, name: "Rishabh Rathore", profilePicture: "images2", elitePoints: 1, skillLevel: .beginner, location: 7.4),
        User(id: 7, name: "Rohit Dixit", profilePicture: "images3", elitePoints: 1, skillLevel: .beginner, location: 9),
        User(id: 8, name: "Ankit Mishra", profilePicture: "Image", elitePoints: 1, skillLevel: .beginner, location: 10.7),
        User(id: 9, name: "Piyush Maurya", profilePicture: "images5", elitePoints: 2, skillLevel: .advanced, location: 20),
        User(id: 17, name: "Rohit", profilePicture: "images13", elitePoints: 2, skillLevel: .advanced, location: 60),
        User(id: 18, name: "Shubham", profilePicture: "images14", elitePoints: 2, skillLevel: .advanced, location: 65),
        User(id: 19, name: "Amit", profilePicture: "images15", elitePoints: 2, skillLevel: .advanced, location: 70),
        User(id: 20, name: "Amit", profilePicture: "images16", elitePoints: 2, skillLevel: .advanced, location: 75),
        User(id: 21, name: "Amit", profilePicture: "images17", elitePoints: 2, skillLevel: .advanced, location: 80),
        User(id: 22, name: "Amit", profilePicture: "images18", elitePoints: 2, skillLevel: .advanced, location: 85),
    ]
    
    static var venueData: [Venue] = [
        Venue(id: 1, name: "Say No To Stress", imageUrl: "v13", rating: 4.0, distanceInKm: 5, location: "Noida", availableCourts: 4),
        Venue(id: 2, name: "Say Sports Academy", imageUrl: "v7", rating: 4.0, distanceInKm: 5, location: "Noida", availableCourts: 4),
        Venue(id: 3, name: "CrowdFit Academy", imageUrl: "v8", rating: 4.0, distanceInKm: 5, location: "Noida", availableCourts: 4),
        Venue(id: 4, name: "Piyush Verma", imageUrl: "v9", rating: 4.0, distanceInKm: 5, location: "Noida", availableCourts: 4),
        Venue(id: 5, name: "Mathura Academy", imageUrl: "v10", rating: 5, distanceInKm: 2, location: "Mathura", availableCourts: 3),
        Venue(id: 6, name: "Gurugram Academy", imageUrl: "v14", rating: 4.0, distanceInKm: 10, location: "Gurugram", availableCourts: 2),
        Venue(id: 7, name: "Delhi Academy", imageUrl: "v12", rating: 4.0, distanceInKm: 15, location: "Delhi", availableCourts: 1),
        Venue(id: 8, name: "Pune Academy", imageUrl: "v6", rating: 4.0, distanceInKm: 20, location: "Pune", availableCourts: 0),
        Venue(id: 9, name: "Mumbai Academy", imageUrl: "v4", rating: 4.0, distanceInKm: 30, location: "Mumbai", availableCourts: 0),
        Venue(id: 10, name: "Kolkata Academy", imageUrl: "v3", rating: 4.0, distanceInKm: 40, location: "Kolkata", availableCourts: 0),
        Venue(id: 11, name: "Bengaluru Academy", imageUrl: "v11", rating: 4.0, distanceInKm: 50, location: "Bengaluru", availableCourts: 0),
        Venue(id: 12, name: "Chennai Academy", imageUrl: "v2", rating: 4.0, distanceInKm: 60, location: "Chennai", availableCourts: 0),
        Venue(id: 13, name: "Hyderabad Academy", imageUrl: "v5", rating: 4.0, distanceInKm: 70, location: "Hyderabad", availableCourts: 0),
        Venue(id: 14, name: "Coimbatore Academy", imageUrl: "v1", rating: 4.0, distanceInKm: 80, location: "Coimbatore", availableCourts: 0),
        Venue(id: 15, name: "Trichy Academy", imageUrl: "v15", rating: 4.0, distanceInKm: 90, location: "Trichy", availableCourts: 0),
        Venue(id: 16, name: "Madurai Academy", imageUrl: "v16", rating: 4.0, distanceInKm: 100, location: "Madurai", availableCourts: 0),
        Venue(id: 17, name: "Thiruvallur Academy", imageUrl: "v17", rating: 4.0, distanceInKm: 110, location: "Thiruvallur", availableCourts: 0),
        
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
struct CreateGame {
    var title: String
    var segmentedControll: UISegmentedControl
    
    var imgae: String
    var venue: String
    var date: String
    var time:String
    var Player: String
}

var players = ScreenData.userData
