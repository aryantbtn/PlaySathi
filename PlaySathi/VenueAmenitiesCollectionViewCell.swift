//
//  VenueAmenitiesCollectionViewCell.swift
//  PlaySathi
//
//  Created by Batch - 2 on 21/01/25.
//

import UIKit

class VenueAmenitiesCollectionViewCell: UICollectionViewCell {

    @IBOutlet var l1: UILabel!
    @IBOutlet var l4: UILabel!
    @IBOutlet var l3: UILabel!
    @IBOutlet var l2: UILabel!
    
    func assignData(with indexpath: IndexPath){
        l1.text = amenities[0]
        l2.text = amenities[1]
        l3.text = amenities[2]
        l4.text = amenities[3]
    }
}
