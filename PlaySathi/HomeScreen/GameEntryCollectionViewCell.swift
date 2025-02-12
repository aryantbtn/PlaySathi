//
//  GameEntryCollectionViewCell.swift
//  PlaySathi
//
//  Created by Batch - 2 on 23/01/25.
//

import UIKit

class GameEntryCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: GameEntryCollectionViewCell.self)
   
    @IBOutlet var dateAndTime: UILabel!
    @IBOutlet var venueName: UILabel!
    func d(with indexPath : IndexPath){
        venueName.text = DataController.venueData[indexPath.row].name
    }
}
