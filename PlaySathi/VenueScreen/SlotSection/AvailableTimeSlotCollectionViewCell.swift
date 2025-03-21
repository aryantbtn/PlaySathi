//
//  AvailableTimeSlotCollectionViewCell.swift
//  PlaySathi
//
//  Created by Batch - 2 on 11/02/25.
//
protocol TimeSlotTableViewCellDelegate: AnyObject {
    func timeSlotSelected(selectedTimeSlot:Int)
}

import UIKit

class AvailableTimeSlotCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: AvailableTimeSlotCollectionViewCell.self)
   
    @IBOutlet var timeSlot: UIButton!
    
    var venueIndex:Int?
    var venueTimeSlotIndex:Int?
    var isCurrentSlotSelected : Bool = false
    var delegate:TimeSlotTableViewCellDelegate?
    var selectedTimeSlot = -1
    var currentTimeSlot:String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(){
        guard let venueIndex = venueIndex, let venueTimeSlotIndex = venueTimeSlotIndex else { return }
        currentTimeSlot = DataController.venueData[venueIndex].timeSlots[venueTimeSlotIndex]
        isCurrentSlotSelected = selectedTimeSlot == venueTimeSlotIndex
        timeSlot.setTitle(currentTimeSlot, for: .normal)
        timeSlot.layer.cornerRadius = 8
        timeSlot.clipsToBounds = true
        if isCurrentSlotSelected {
            timeSlot.backgroundColor = .systemGreen
        } else {
            timeSlot.backgroundColor = .white
        }
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        guard let venueIndex = venueIndex, let venueTimeSlotIndex = venueTimeSlotIndex else { return }
        isCurrentSlotSelected.toggle()
        if isCurrentSlotSelected {
            selectedTimeSlot = venueTimeSlotIndex
        } else {
            selectedTimeSlot = -1
        }
        updateButtonColor()
        delegate?.timeSlotSelected(selectedTimeSlot: self.selectedTimeSlot)
    }
    
    
    func updateButtonColor(){
        if isCurrentSlotSelected {
            timeSlot.backgroundColor = .systemGreen
        } else {
            timeSlot.backgroundColor = .white
        }
    }
        
    }

