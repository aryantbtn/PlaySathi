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
        isBooked = Bool.random()
                
                courtOutlet.setTitle(currentCourt, for: .normal)
                updateCellAppearance()
        courtOutlet.setTitle(currentCourt, for: .normal)
        if isCurrentSlotSelected {
            courtOutlet.backgroundColor = .systemGreen
        } else {
            courtOutlet.backgroundColor = .white
        }
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
        if !isBooked {
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
       }











   
    
    
    

