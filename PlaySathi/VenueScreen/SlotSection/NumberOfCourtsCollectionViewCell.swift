//
//  NumberOfCourtsCollectionViewCell.swift
//  PlaySathi
//
//  Created by Batch - 2 on 11/02/25.
//


protocol CourtTableViewCellDelegate: AnyObject {
    func courtSelected(selectedCourt:Int)
}

import UIKit

class NumberOfCourtsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: NumberOfCourtsCollectionViewCell.self)
    var isBooked: Bool = false
    
    @IBOutlet var courtOutlet: UIButton!
    
    private var bookedCourts: Set<Int> = []
    var venueIndex:Int?
    var venueCourtIndex:Int?
    var isCurrentSlotSelected : Bool = false
    var delegat:CourtTableViewCellDelegate?
    var selectedCourt = -1
    var currentCourt:String = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func configure() {
        guard let venueIndex = venueIndex, let venueCourtIndex = venueCourtIndex else { return }
        currentCourt = DataController.venueData[venueIndex].numberOfCourts[venueCourtIndex]
        isCurrentSlotSelected = selectedCourt == venueCourtIndex
        
        // isBooked is now set from the SlotTableViewController
        courtOutlet.setTitle(currentCourt, for: .normal)
        updateCellAppearance()
    }

    private func updateCellAppearance() {
        if isBooked {
            courtOutlet.backgroundColor = .systemGray4
            courtOutlet.isEnabled = false
        } else if isCurrentSlotSelected {
            courtOutlet.backgroundColor = .systemGreen
            courtOutlet.isEnabled = true
        } else {
            courtOutlet.backgroundColor = .white
            courtOutlet.isEnabled = true
        }
        
        courtOutlet.layer.cornerRadius = 8
        courtOutlet.layer.borderWidth = 1
        courtOutlet.layer.borderColor = UIColor.gray.cgColor
    }
    
    
    
    
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        guard !isBooked else { return }
        
        // Only toggle selection for available courts
        isCurrentSlotSelected.toggle()
        if isCurrentSlotSelected {
            selectedCourt = venueCourtIndex ?? -1
        } else {
            selectedCourt = -1
        }
        updateCellAppearance()
        delegat?.courtSelected(selectedCourt: self.selectedCourt)
    }
    
    
}








   
    
    
    

