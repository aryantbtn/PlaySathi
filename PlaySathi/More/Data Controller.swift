//
//  Data Controller.swift
//  PlaySathi
//
//  Created by Batch - 2 on 31/01/25.
//

import Foundation


class DataController{
    
    static var userData: [User] = [
        User(id: UUID(), name: "Amitabh", profilePicture: "images6", elitePoints: 400, skillLevel: .advanced, distance: 2.5, location: "we"),
        User(id: UUID(), name: "Shubham", profilePicture: "images7", elitePoints: 500, skillLevel: .advanced, distance: 3.0, location: "WE"),
        User(id: UUID(), name: "Shivam", profilePicture: "images8", elitePoints: 600, skillLevel: .advanced, distance: 3.5, location: "FD"),
        User(id: UUID(), name: "Kunal", profilePicture: "images9", elitePoints: 529, skillLevel: .advanced, distance: 4.6, location: "FD"),
        User(id: UUID(), name: "Vishal", profilePicture: "images10", elitePoints: 438, skillLevel: .advanced, distance: 5.0, location: "v"),
        User(id: UUID(), name: "Jatin", profilePicture: "images11", elitePoints: 502, skillLevel: .advanced, distance: 5.0, location: "dg"),
        User(id: UUID(), name: "Amit", profilePicture: "images12", elitePoints: 488, skillLevel: .advanced, distance: 5.5, location: "VS"),
        User(id: UUID(), name: "Alok Kumar", profilePicture: "images4", elitePoints: 633, skillLevel: .advanced, distance: 8.2, location: "FN"),
        User(id: UUID(), name: "Umesh Gaur", profilePicture: "images1", elitePoints: 442, skillLevel: .beginner, distance: 12, location: "SV"),
        User(id: UUID(), name: "Rishabh Rathore", profilePicture: "images2", elitePoints: 400, skillLevel: .beginner, distance: 13.4, location: "A"),
        User(id: UUID(), name: "Rohit Dixit", profilePicture: "images3", elitePoints: 492, skillLevel: .beginner, distance: 19, location: "EF"),
        User(id: UUID(), name: "Ankit Mishra", profilePicture: "Image", elitePoints: 594, skillLevel: .beginner, distance: 21, location: "F"),
        User(id: UUID(), name: "Piyush Maurya", profilePicture: "images5", elitePoints: 644, skillLevel: .advanced, distance: 23.4, location: "Faes"),
        User(id: UUID(), name: "Rohit", profilePicture: "images13", elitePoints: 465, skillLevel: .advanced, distance: 25.9, location: "ERF"),
        User(id: UUID(), name: "Shubham", profilePicture: "images14", elitePoints: 443, skillLevel: .advanced, distance: 27.5, location: "FDs"),
        User(id: UUID(), name: "Amit", profilePicture: "images15", elitePoints: 562, skillLevel: .advanced, distance: 30, location: "FG"),
        User(id: UUID(), name: "Amit", profilePicture: "images16", elitePoints: 442, skillLevel: .advanced, distance: 35, location: "SFD"),
        User(id: UUID(), name: "Amit", profilePicture: "images17", elitePoints: 452, skillLevel: .advanced, distance: 38.9, location: "FS"),
        User(id: UUID(), name: "Amit", profilePicture: "images18", elitePoints: 462, skillLevel: .advanced, distance: 40, location: "SF"),
    ]
    
    static var venueData: [Venue] = [
        Venue(id: UUID(), name: "Sai Sports Academy", imageUrl: "v13", rating: 4.0, distanceInKm: 5, location: "Noida", numberOfCourts: 4, price: 230, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "FSER",closingTime: "2"),
        Venue(id: UUID(), name: "Say Sports Academy", imageUrl: "v7", rating: 4.0, distanceInKm: 5, location: "Noida", numberOfCourts: 4, price: 500, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "3",closingTime: "3"),
        Venue(id: UUID(), name: "CrowdFit Academy", imageUrl: "v8", rating: 4.0, distanceInKm: 5, location: "Noida",numberOfCourts : 4, price: 200, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "2",closingTime: "5"),
        Venue(id: UUID(), name: "Piyush Verma", imageUrl: "v9", rating: 4.0, distanceInKm: 5, location: "Noida", numberOfCourts: 4, price: 300, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "#",closingTime: "7"),
        Venue(id: UUID(), name: "Mathura Academy", imageUrl: "v10", rating: 5, distanceInKm: 2, location: "Mathura", numberOfCourts: 3, price: 300, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "%",closingTime: "7"),
        Venue(id: UUID(), name: "Gurugram Academy", imageUrl: "v14", rating: 4.0, distanceInKm: 10, location: "Gurugram", numberOfCourts: 2, price: 300, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "2",closingTime: "3"),
        Venue(id: UUID(), name: "Delhi Academy", imageUrl: "v12", rating: 4.0, distanceInKm: 15, location: "Delhi", numberOfCourts: 1, price: 200, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "4",closingTime: "4"),
        Venue(id: UUID(), name: "Pune Academy", imageUrl: "v6", rating: 4.0, distanceInKm: 20, location: "Pune", numberOfCourts: 0, price: 260, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "&",closingTime: "4"),
        Venue(id: UUID(), name: "Mumbai Academy", imageUrl: "v4", rating: 4.0, distanceInKm: 30, location: "Mumbai", numberOfCourts: 0, price: 321, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "@",closingTime: "4"),
        Venue(id: UUID(), name: "Kolkata Academy", imageUrl: "v3", rating: 4.0, distanceInKm: 40, location: "Kolkata", numberOfCourts: 0, price: 345, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "6",closingTime: "%"),
        Venue(id: UUID(), name: "Bengaluru Academy", imageUrl: "v11", rating: 4.0, distanceInKm: 50, location: "Bengaluru", numberOfCourts: 0, price: 543, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "3",closingTime: "5"),
        Venue(id: UUID(), name: "Chennai Academy", imageUrl: "v2", rating: 4.0, distanceInKm: 60, location: "Chennai", numberOfCourts: 0, price: 230, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "6",closingTime: "1"),
        Venue(id: UUID(), name: "Hyderabad Academy", imageUrl: "v5", rating: 4.0, distanceInKm: 70, location: "Hyderabad", numberOfCourts: 0, price: 432, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "@",closingTime: "6"),
        Venue(id: UUID(), name: "Coimbatore Academy", imageUrl: "v1", rating: 4.0, distanceInKm: 80, location: "Coimbatore", numberOfCourts: 0, price: 230, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "3",closingTime: "6"),
        Venue(id: UUID(), name: "Trichy Academy", imageUrl: "v15", rating: 4.0, distanceInKm: 90, location: "Trichy", numberOfCourts: 0, price: 430, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "2",closingTime: "6"),
        Venue(id: UUID(), name: "Madurai Academy", imageUrl: "v16", rating: 4.0, distanceInKm: 100, location: "Madurai", numberOfCourts: 0, price: 320, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "1",closingTime: "^"),
        Venue(id: UUID(), name: "Thiruvallur Academy", imageUrl: "v17", rating: 4.0, distanceInKm: 110, location: "Thiruvallur", numberOfCourts: 0, price: 320, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "1",closingTime: "7"),
        
    ]
    
    
    static var sectionHeaderNames:[String] = [
        "",
        "Nearby Players",
        "Venue Near Me",
        "Matches",
        "Request Sent",
        "Matches"
    ]
    
    
    static var sectionHeadersForVenueDetails:[String] = [
        "",
        "Venue Description",
        "Amenities"
        ]
    
    
    
}
