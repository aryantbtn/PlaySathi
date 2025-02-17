//
//  VenueAmenitiesCollectionViewCell.swift
//  PlaySathi
//
//  Created by Batch - 2 on 21/01/25.
//

import UIKit

class VenueAmenitiesCollectionViewCell: UICollectionViewCell {

    @IBOutlet var l1: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    func assignData(with indexpath: IndexPath,aminity:IndexPath){
        l1.text = DataController.venueData[indexpath.row].amenities[aminity.row]
        let amenity = DataController.venueData[indexpath.row].amenities[aminity.row]
        switch amenity {
            case "Wifi":
            imageView.image = UIImage(systemName: "wifi")
        case "Parking":
            imageView.image = UIImage(systemName: "p.square")
        case "Restrooms":
            imageView.image = UIImage(systemName: "house")
        case "Swimming Pool":
            imageView.image = UIImage(systemName: "figure.pool.swim.circle")
        case "Changing Room":
            imageView.image = UIImage(systemName: "shower")
        case "Water":
            imageView.image = UIImage(systemName: "drop")
        default:
            break
        }
        
    }
}
