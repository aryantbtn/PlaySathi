//
//  AvailableTimeSlotCollectionViewCell.swift
//  PlaySathi
//
//  Created by Batch - 2 on 11/02/25.
//
import UIKit

class AvailableTimeSlotCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: AvailableTimeSlotCollectionViewCell.self)
    //var timeSlot: [String]
    @IBOutlet var timeSlot: UIButton!
     var isSelectedSlot : Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        
               isSelectedSlot.toggle()
               
               if isSelectedSlot {
                   timeSlot.backgroundColor = .systemGreen
               } else {
                   timeSlot.backgroundColor = .white 
               }
           }
        
    }

