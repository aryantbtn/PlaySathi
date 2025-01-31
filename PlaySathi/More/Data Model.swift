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
    var distance: Double
    
}
enum SkillLevel: String {
        case beginner = "Beginner"
        case intermediate = "Intermediate"
        case advanced = "Advanced"
}

class ScreenData{
    
    static var userData: [User] = [
        User(id: 10, name: "Amitabh", profilePicture: "images6", elitePoints: 400, skillLevel: .advanced, distance: 2.5),
        User(id: 11, name: "Shubham", profilePicture: "images7", elitePoints: 500, skillLevel: .advanced, distance: 3.0),
        User(id: 12, name: "Shivam", profilePicture: "images8", elitePoints: 600, skillLevel: .advanced, distance: 3.5),
        User(id: 13, name: "Kunal", profilePicture: "images9", elitePoints: 529, skillLevel: .advanced, distance: 4.6),
        User(id: 14, name: "Vishal", profilePicture: "images10", elitePoints: 438, skillLevel: .advanced, distance: 5.0),
        User(id: 15, name: "Jatin", profilePicture: "images11", elitePoints: 502, skillLevel: .advanced, distance: 5.0),
        User(id: 16, name: "Amit", profilePicture: "images12", elitePoints: 488, skillLevel: .advanced, distance: 5.5),
        User(id: 4, name: "Alok Kumar", profilePicture: "images4", elitePoints: 633, skillLevel: .advanced, distance: 8.2),
        User(id: 5, name: "Umesh Gaur", profilePicture: "images1", elitePoints: 442, skillLevel: .beginner, distance: 12),
        User(id: 6, name: "Rishabh Rathore", profilePicture: "images2", elitePoints: 400, skillLevel: .beginner, distance: 13.4),
        User(id: 7, name: "Rohit Dixit", profilePicture: "images3", elitePoints: 492, skillLevel: .beginner, distance: 19),
        User(id: 8, name: "Ankit Mishra", profilePicture: "Image", elitePoints: 594, skillLevel: .beginner, distance: 21),
        User(id: 9, name: "Piyush Maurya", profilePicture: "images5", elitePoints: 644, skillLevel: .advanced, distance: 23.4),
        User(id: 17, name: "Rohit", profilePicture: "images13", elitePoints: 465, skillLevel: .advanced, distance: 25.9),
        User(id: 18, name: "Shubham", profilePicture: "images14", elitePoints: 443, skillLevel: .advanced, distance: 27.5),
        User(id: 19, name: "Amit", profilePicture: "images15", elitePoints: 562, skillLevel: .advanced, distance: 30),
        User(id: 20, name: "Amit", profilePicture: "images16", elitePoints: 442, skillLevel: .advanced, distance: 35),
        User(id: 21, name: "Amit", profilePicture: "images17", elitePoints: 452, skillLevel: .advanced, distance: 38.9),
        User(id: 22, name: "Amit", profilePicture: "images18", elitePoints: 462, skillLevel: .advanced, distance: 40),
    ]
    
    static var venueData: [Venue] = [
        Venue(id: 1, name: "Sai Sports Academy", imageUrl: "v13", rating: 4.0, distanceInKm: 5, location: "Noida", availableCourts: 4, price: 230),
        Venue(id: 2, name: "Say Sports Academy", imageUrl: "v7", rating: 4.0, distanceInKm: 5, location: "Noida", availableCourts: 4, price: 500),
        Venue(id: 3, name: "CrowdFit Academy", imageUrl: "v8", rating: 4.0, distanceInKm: 5, location: "Noida", availableCourts: 4, price: 200),
        Venue(id: 4, name: "Piyush Verma", imageUrl: "v9", rating: 4.0, distanceInKm: 5, location: "Noida", availableCourts: 4, price: 300),
        Venue(id: 5, name: "Mathura Academy", imageUrl: "v10", rating: 5, distanceInKm: 2, location: "Mathura", availableCourts: 3, price: 300),
        Venue(id: 6, name: "Gurugram Academy", imageUrl: "v14", rating: 4.0, distanceInKm: 10, location: "Gurugram", availableCourts: 2, price: 300),
        Venue(id: 7, name: "Delhi Academy", imageUrl: "v12", rating: 4.0, distanceInKm: 15, location: "Delhi", availableCourts: 1, price: 200),
        Venue(id: 8, name: "Pune Academy", imageUrl: "v6", rating: 4.0, distanceInKm: 20, location: "Pune", availableCourts: 0, price: 260),
        Venue(id: 9, name: "Mumbai Academy", imageUrl: "v4", rating: 4.0, distanceInKm: 30, location: "Mumbai", availableCourts: 0, price: 321),
        Venue(id: 10, name: "Kolkata Academy", imageUrl: "v3", rating: 4.0, distanceInKm: 40, location: "Kolkata", availableCourts: 0, price: 345),
        Venue(id: 11, name: "Bengaluru Academy", imageUrl: "v11", rating: 4.0, distanceInKm: 50, location: "Bengaluru", availableCourts: 0, price: 543),
        Venue(id: 12, name: "Chennai Academy", imageUrl: "v2", rating: 4.0, distanceInKm: 60, location: "Chennai", availableCourts: 0, price: 230),
        Venue(id: 13, name: "Hyderabad Academy", imageUrl: "v5", rating: 4.0, distanceInKm: 70, location: "Hyderabad", availableCourts: 0, price: 432),
        Venue(id: 14, name: "Coimbatore Academy", imageUrl: "v1", rating: 4.0, distanceInKm: 80, location: "Coimbatore", availableCourts: 0, price: 230),
        Venue(id: 15, name: "Trichy Academy", imageUrl: "v15", rating: 4.0, distanceInKm: 90, location: "Trichy", availableCourts: 0, price: 430),
        Venue(id: 16, name: "Madurai Academy", imageUrl: "v16", rating: 4.0, distanceInKm: 100, location: "Madurai", availableCourts: 0, price: 320),
        Venue(id: 17, name: "Thiruvallur Academy", imageUrl: "v17", rating: 4.0, distanceInKm: 110, location: "Thiruvallur", availableCourts: 0, price: 320),
        
    ]
    
    
    static var sectionHeaderNames:[String] = [
        "",
        "Nearby Players",
        "Venue Near Me",
        "Matches",
        "Request Sent"
    ]
    
    
    static var sectionHeadersForVenueDetails:[String] = [
        "",
        "Venue Description",
        "Amenities"
        ]
}


var section = 3

struct Venue {
    let id: Int //UUID
    var name: String
    var imageUrl: String
    var rating: Double
    var distanceInKm: Double
    var location: String
    var availableCourts: Int
    var price : Int
}

    var amenities = [
    "Parking",
    "Rooms",
    "Cafeteria",
    "Shower"
    ]



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
struct Game {
    var gameTitle: String
    var venue:Venue
}
var newCreatedGame = Game(gameTitle: "This", venue: Venue(id: 65, name: "", imageUrl: "random", rating: 9, distanceInKm: 9.9, location: "feefe", availableCourts: 9, price: 200))
var valu: Bool = false


class Singleton{
    static let navigate = Singleton()
    var check : String?
}
