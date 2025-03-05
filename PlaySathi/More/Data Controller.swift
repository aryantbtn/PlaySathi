//
//  Data Controller.swift
//  PlaySathi
//
//  Created by Batch - 2 on 31/01/25.
//

import Foundation
import UIKit


class DataController{
    


    
    static var venueData: [Venue] = [
        Venue(id: UUID(), name: "Sai Sports Academy", imageUrl: "v13", rating: 4.0, distanceInKm: 5, location: "Noida", numberOfCourts: ["Court1","Court2","Court3","Court4","Court5"], price: 200, amenities: ["Parking","Swimming Pool","Changing Room", "Water","Wifi","Camera","Restrooms"],openingTime: "FSER",closingTime: "2",
              timeSlots: ["2PM-3PM","6PM-8PM","9PM-10PM","5PM-6PM"],
              courtAvailability:[
            "Court1": ["2PM-3PM","6PM-8PM","9PM-10PM"],
            "Court2": ["2PM-3PM","5PM-6PM"],
            "Court3": ["6PM-8PM","9PM-10PM"],
            "Court4": ["2PM-3PM","6PM-8PM"],
            "Court5": ["5PM-6PM","9PM-10PM"]
          ]),
        
        Venue(id: UUID(), name: "Say Sports Academy", imageUrl: "v7", rating: 4.0, distanceInKm: 5, location: "Noida", numberOfCourts: ["Court1","Court2","Court3","Court4","Court5"], price: 500, amenities: ["Parking","Swimming Pool","Changing Room", "Water"], openingTime: "3",closingTime: "3",
              timeSlots: ["2PM-3PM","6PM-8PM","9PM-10PM","5PM-6PM"],
              courtAvailability:  [
                "Court3": ["6PM-8PM","9PM-10PM"],
                "Court4": ["2PM-3PM","6PM-8PM"],
                "Court5": ["5PM-6PM","9PM-10PM"]
        ]),
        
        Venue(id: UUID(), name: "CrowdFit Academy", imageUrl: "v8", rating: 4.0, distanceInKm: 5, location: "Noida",numberOfCourts : ["Court1","Court2","Court3","Court4"], price: 220, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "2",closingTime: "5",
              timeSlots: ["2PM-3PM","6PM-8PM","9PM-10PM","5PM-6PM"],
              courtAvailability: [
                "Court3": ["6PM-8PM","9PM-10PM"],
                "Court4": ["2PM-3PM","6PM-8PM"],
                "Court5": ["5PM-6PM","9PM-10PM"]
        ]),
        
        Venue(id: UUID(), name: "Rohini Sports Complex", imageUrl: "v9", rating: 4.0, distanceInKm: 5, location: "Noida", numberOfCourts: ["Court1","Court2","Court3","Court4"], price: 200, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "5 AM",closingTime: "7 PM",
              timeSlots: ["2PM-3PM","6PM-8PM","9PM-10PM","5PM-6PM"],
              courtAvailability: [
                "Court3": ["6PM-8PM","9PM-10PM"],
                "Court4": ["2PM-3PM","6PM-8PM"],
                "Court5": ["5PM-6PM","9PM-10PM"]
        ]),
        
        Venue(id: UUID(), name: "Mathura Academy", imageUrl: "v10", rating: 5, distanceInKm: 2, location: "Mathura", numberOfCourts: ["Court1","Court2","Court3","Court4"], price: 300, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "9 AM",closingTime: "7 PM",
              timeSlots: ["2PM-3PM","6PM-8PM","9PM-10PM","5PM-6PM"],
              courtAvailability: [
                "Court3": ["6PM-8PM","9PM-10PM"],
                "Court4": ["2PM-3PM","6PM-8PM"],
                "Court5": ["5PM-6PM","9PM-10PM"]
        ]),
        
        Venue(id: UUID(), name: "Gurugram Academy", imageUrl: "v14", rating: 4.0, distanceInKm: 10, location: "Gurugram", numberOfCourts: ["Court1","Court2","Court3","Court4"], price: 300, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "2 PM",closingTime: "12 PM",
              timeSlots: ["2PM-3PM","6PM-8PM","9PM-10PM","5PM-6PM"],
              courtAvailability: [
                "Court3": ["6PM-8PM","9PM-10PM"],
                "Court4": ["2PM-3PM","6PM-8PM"],
                "Court5": ["5PM-6PM","9PM-10PM"]
        ]),
        
        Venue(id: UUID(), name: "Delhi Academy", imageUrl: "v12", rating: 4.0, distanceInKm: 15, location: "Delhi", numberOfCourts: ["Court1","Court2","Court3","Court4"], price: 250, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "4 AM",closingTime: "8 PM",
              timeSlots: ["2PM-3PM","6PM-8PM","9PM-10PM","5PM-6PM"],
              courtAvailability: [
                "Court3": ["6PM-8PM","9PM-10PM"],
                "Court4": ["2PM-3PM","6PM-8PM"],
                "Court5": ["5PM-6PM","9PM-10PM"]
        ]),
        
        Venue(id: UUID(), name: "Pune Academy", imageUrl: "v6", rating: 4.0, distanceInKm: 20, location: "Pune", numberOfCourts: ["Court1","Court2","Court3","Court4"], price: 260, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "10 AM",closingTime: "4 PM",
              timeSlots: ["2PM-3PM","6PM-8PM","9PM-10PM","5PM-6PM"],
              courtAvailability: [
                "Court3": ["6PM-8PM","9PM-10PM"],
                "Court4": ["2PM-3PM","6PM-8PM"],
                "Court5": ["5PM-6PM","9PM-10PM"]
        ]),
        
        Venue(id: UUID(), name: "Mumbai Academy", imageUrl: "v4", rating: 4.0, distanceInKm: 30, location: "Mumbai", numberOfCourts: ["Court1","Court2","Court3","Court4"], price: 321, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "6 AM",closingTime: "4 PM",
              timeSlots: ["2PM-3PM","6PM-8PM","9PM-10PM","5PM-6PM"],
              courtAvailability: [
                "Court3": ["6PM-8PM","9PM-10PM"],
                "Court4": ["2PM-3PM","6PM-8PM"],
                "Court5": ["5PM-6PM","9PM-10PM"]
        ]),
        
        Venue(id: UUID(), name: "Kolkata Academy", imageUrl: "v3", rating: 4.0, distanceInKm: 40, location: "Kolkata", numberOfCourts: ["Court1","Court2","Court3","Court4"], price: 345, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "6 AM",closingTime: "4 PM",
              timeSlots: ["2PM-3PM","6PM-8PM","9PM-10PM","5PM-6PM"],
              courtAvailability: [
                "Court3": ["6PM-8PM","9PM-10PM"],
                "Court4": ["2PM-3PM","6PM-8PM"],
                "Court5": ["5PM-6PM","9PM-10PM"]
        ]),
        
        Venue(id: UUID(), name: "Bengaluru Academy", imageUrl: "v11", rating: 4.0, distanceInKm: 50, location: "Bengaluru", numberOfCourts: ["Court1","Court2","Court3","Court4"], price: 543, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "7 AM",closingTime: "5 PM",
              timeSlots: ["2PM-3PM","6PM-8PM","9PM-10PM","5PM-6PM"],
              courtAvailability: [
                "Court3": ["6PM-8PM","9PM-10PM"],
                "Court4": ["2PM-3PM","6PM-8PM"],
                "Court5": ["5PM-6PM","9PM-10PM"]
        ]),
        
        Venue(id: UUID(), name: "Chennai Academy", imageUrl: "v2", rating: 4.0, distanceInKm: 60, location: "Chennai", numberOfCourts: ["Court1","Court2","Court3","Court4"], price: 230, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "6 AM",closingTime: "1 PM",
              timeSlots: ["2PM-3PM","6PM-8PM","9PM-10PM","5PM-6PM"],
              courtAvailability: [
                "Court3": ["6PM-8PM","9PM-10PM"],
                "Court4": ["2PM-3PM","6PM-8PM"],
                "Court5": ["5PM-6PM","9PM-10PM"]
        ]),
        
        Venue(id: UUID(), name: "Hyderabad Academy", imageUrl: "v5", rating: 4.0, distanceInKm: 70, location: "Hyderabad", numberOfCourts: ["Court1","Court2","Court3","Court4"], price: 432, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "7 AM",closingTime: "6 PM",
              timeSlots: ["2PM-3PM","6PM-8PM","9PM-10PM","5PM-6PM"],
              courtAvailability: [
                "Court3": ["6PM-8PM","9PM-10PM"],
                "Court4": ["2PM-3PM","6PM-8PM"],
                "Court5": ["5PM-6PM","9PM-10PM"]
        ]),
        
        Venue(id: UUID(), name: "Coimbatore Academy", imageUrl: "v1", rating: 4.0, distanceInKm: 80, location: "Coimbatore", numberOfCourts: ["Court1","Court2","Court3","Court4"], price: 230, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "7 AM",closingTime: "8 PM",
              timeSlots: ["2PM-3PM","6PM-8PM","9PM-10PM","5PM-6PM"],
              courtAvailability: [
                "Court3": ["6PM-8PM","9PM-10PM"],
                "Court4": ["2PM-3PM","6PM-8PM"],
                "Court5": ["5PM-6PM","9PM-10PM"]
        ]),
        
        Venue(id: UUID(), name: "Trichy Academy", imageUrl: "v15", rating: 4.0, distanceInKm: 90, location: "Trichy", numberOfCourts: ["Court1","Court2","Court3","Court4"], price: 430, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "5 AM",closingTime: "6 PM",
              timeSlots: ["2PM-3PM","6PM-8PM","9PM-10PM","5PM-6PM"],
              courtAvailability: [
                "Court3": ["6PM-8PM","9PM-10PM"],
                "Court4": ["2PM-3PM","6PM-8PM"],
                "Court5": ["5PM-6PM","9PM-10PM"]
        ]),
        
        Venue(id: UUID(), name: "Madurai Academy", imageUrl: "v16", rating: 4.0, distanceInKm: 100, location: "Madurai", numberOfCourts: ["Court1","Court2","Court3","Court4"], price: 320, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "1 PM",closingTime: "10 PM",
              timeSlots: ["2PM-3PM","6PM-8PM","9PM-10PM","5PM-6PM"],
              courtAvailability: [
                "Court3": ["6PM-8PM","9PM-10PM"],
                "Court4": ["2PM-3PM","6PM-8PM"],
                "Court5": ["5PM-6PM","9PM-10PM"]
        ]),
        
        Venue(id: UUID(), name: "Thiruvallur Academy", imageUrl: "v17", rating: 4.0, distanceInKm: 110, location: "Thiruvallur", numberOfCourts: ["Court1","Court2","Court3","Court4"], price: 320, amenities: ["Parking","Swimming Pool","Changing Room", "Water"],openingTime: "1 PM",closingTime: "7 PM",
              timeSlots: ["2PM-3PM","6PM-8PM","9PM-10PM","5PM-6PM"],
              courtAvailability: [
                "Court3": ["6PM-8PM","9PM-10PM"],
                "Court4": ["2PM-3PM","6PM-8PM"],
                "Court5": ["5PM-6PM","9PM-10PM"]
        ])
    ]
    
    
    static var headers : [TypeOfSection:String] = [.createGame:"",.player:"Nearby Players", .venue : "Venue Near Me "]
    
    
    static var sectionHeadersForVenueDetails:[String] = [
        "",
        "Venue Description",
        "Amenities"
    ]
    
}
