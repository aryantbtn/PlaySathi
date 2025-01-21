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
    
    @IBOutlet var distanceLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    
    
    func display(with indexPath: IndexPath){
        ImageLabel.image =  UIImage(named: ScreenData.venueData[indexPath.row].imageUrl)
    nameLabel.text = ScreenData.venueData[indexPath.row].name
        distanceLabel.text = "Distance ~ " + ScreenData.venueData[indexPath.row].distanceInKm.formatted() + " kms"
        
    }
}
