//
//  VenueDescriptionCollectionViewCell.swift
//  PlaySathi
//
//  Created by Batch - 2 on 21/01/25.
//

import UIKit

class VenueDescriptionCollectionViewCell: UICollectionViewCell {

    
      @IBOutlet var label3: UILabel!
       @IBOutlet var label2: UILabel!
      @IBOutlet var label1: UILabel!
    
    
    func show (with indexpath: IndexPath){
        label1.text = "Get ready to smash"
        label2.text = "Bookings are Now Open! Reserve your spot early and enjoy Flat 15% discount to celebrate the launch!"
        label3.text = "Step onto India's Biggest Crowdfit Badminton courts imported from Poland! Designed for champions and sports enthusiasts, these world-class courts bring you the ultimate playing experience."
    }
}
