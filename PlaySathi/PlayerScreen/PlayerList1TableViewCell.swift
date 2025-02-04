//
//  PlayerList1TableViewCell.swift
//  PlaySathi
//
//  Created by Batch - 2 on 20/01/25.
//

import UIKit

class PlayerList1TableViewCell: UITableViewCell {
    
    

   
    
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerDescription: UILabel!
    
    
//    @IBOutlet weak var chevronButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func upadateCell(with indexPath: IndexPath) {
        print ("hello update")
        playerImageView.image = UIImage(named: DataController.userData[indexPath.row].profilePicture)
        playerImageView.layer.cornerRadius = playerImageView.bounds.width / 2
        playerNameLabel.text = DataController.userData[indexPath.row].name
        playerDescription.text = "Distance ~ " + DataController.userData[indexPath.row].distance.formatted() + " kms" + " | \(DataController.userData[indexPath.row].elitePoints) EP"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    /* Player Cell Chevron
    @IBAction func chevronAction(_ sender: UIButton) {
        if chevronButton.isSelected {
            print("Chevron is tapped")
        }
    }
     */
    
}
