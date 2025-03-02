//
//  GameEntryCollectionViewCell.swift
//  PlaySathi
//
//  Created by Batch - 2 on 23/01/25.
//

import UIKit

class GameEntryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: GameEntryCollectionViewCell.self)
   
    @IBOutlet weak var host: UIImageView!
    @IBOutlet var dateAndTime: UILabel!
    @IBOutlet var venueName: UILabel!
   
    
    func updateCourtBooked(with indexPath : IndexPath) {
        venueName.text = DataController.venueData[indexPath.row].name
        host.layer.cornerRadius = host.bounds.height / 2
     host.layer.borderWidth = 2
        host.layer.borderColor = UIColor(red: 46/255, green: 107/255, blue: 101/255, alpha: 1).cgColor
    }
    
    
}
