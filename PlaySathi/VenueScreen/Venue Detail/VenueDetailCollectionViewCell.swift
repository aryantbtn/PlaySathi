//
//  VenueDetailCollectionViewCell.swift
//  PlaySathi
//
//  Created by Batch - 2 on 20/01/25.
//

import UIKit

class VenueDetailCollectionViewCell: UICollectionViewCell {
    
    //static let identifier = String(describing: VenueDetailCollectionViewCell.self)

    @IBOutlet var ImageLabel: UIImageView!
    @IBOutlet var venuePrice: UILabel!
    @IBOutlet var distanceLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    
    
    func display(with indexPath: IndexPath){
        ImageLabel.image =  UIImage(named: DataController.venueData[indexPath.row].imageUrl)
    nameLabel.text = DataController.venueData[indexPath.row].name
        distanceLabel.text = "Distance ~ " + DataController.venueData[indexPath.row].distanceInKm.formatted() + " kms"
        venuePrice.text = "Price ~ " + DataController.venueData[indexPath.row].price.formatted() + "Rs."
        
    }
}
