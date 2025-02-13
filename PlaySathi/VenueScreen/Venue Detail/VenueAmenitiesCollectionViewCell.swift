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
        
    }
}
