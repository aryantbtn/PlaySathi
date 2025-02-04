//
//  VenueCollectionViewCell.swift
//  PlaySathi
//
//  Created by Batch - 2 on 16/01/25.
//

import UIKit

class VenueCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: VenueCollectionViewCell.self)
    @IBOutlet weak var venueImage: UIImageView!
    
    @IBOutlet weak var venueName: UILabel!
    
    @IBOutlet weak var venueDistance: UILabel!
    
    
    func update(with indexPath: IndexPath){
        venueImage.image = UIImage(named: DataController.venueData[indexPath.row].imageUrl)
        venueName.text = DataController.venueData[indexPath.row].name
        venueDistance.text = "Distance ~ " + DataController.venueData[indexPath.row].distanceInKm.formatted() + " kms"
    }
}
