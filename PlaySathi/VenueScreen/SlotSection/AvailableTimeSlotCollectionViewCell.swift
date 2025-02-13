//
//  AvailableTimeSlotCollectionViewCell.swift
//  PlaySathi
//
//  Created by Batch - 2 on 11/02/25.
//
import UIKit

class AvailableTimeSlotCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: AvailableTimeSlotCollectionViewCell.self)
    @IBOutlet var timeSlotLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        timeSlotLabel.textAlignment = .center
    }
}
