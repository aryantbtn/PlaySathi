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
    
    @IBOutlet var courtOutlet: UIButton!
    
    
    var venueIndex:Int?
    var venueCourtIndex:Int?
    var isCurrentSlotSelected : Bool = false
    var delegat:CourtTableViewCellDelegate?
    var selectedCourt = -1
    var currentCourt:String = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func configure(){
        guard let venueIndex = venueIndex, let venueCourtIndex = venueCourtIndex else { return }
        currentCourt = DataController.venueData[venueIndex].numberOfCourts[venueCourtIndex]
        isCurrentSlotSelected = selectedCourt == venueCourtIndex
        courtOutlet.setTitle(currentCourt, for: .normal)
        if isCurrentSlotSelected {
            courtOutlet.backgroundColor = .systemGreen
        } else {
            courtOutlet.backgroundColor = .white
        }
    }
    
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        guard let venueIndex = venueIndex, let venueCourtIndex = venueCourtIndex else { return }
        isCurrentSlotSelected.toggle()
        if isCurrentSlotSelected {
            selectedCourt = venueCourtIndex
        } else {
            selectedCourt = -1
        }
        buttonColor()
        delegat?.courtSelected(selectedCourt: self.selectedCourt)
    }
    func buttonColor(){
        if isCurrentSlotSelected {
            courtOutlet.backgroundColor = .systemGreen
        } else {
            courtOutlet.backgroundColor = .white
        }
    }
}











   
    
    
    

