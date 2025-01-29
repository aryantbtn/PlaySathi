//
//  VenueListCollectionViewCell.swift
//  PlaySathi
//
//  Created by Batch - 2 on 16/01/25.
//

import UIKit

class VenueListCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: VenueListCollectionViewCell.self)
    @IBOutlet var venueListImage: UIImageView!
    
    @IBOutlet var venueListDistance: UILabel!
    @IBOutlet var venueListName: UILabel!
    
    func updateFunc(with indexPath: IndexPath){
        venueListImage.image = UIImage(named: ScreenData.venueData[indexPath.row].imageUrl)
        venueListName.text = ScreenData.venueData[indexPath.row].name
        venueListDistance.text = "Distance ~ " + ScreenData.venueData[indexPath.row].distanceInKm.formatted() + " kms"
    }
}
