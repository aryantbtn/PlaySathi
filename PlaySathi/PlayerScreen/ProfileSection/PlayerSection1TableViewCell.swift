//
//  PlayerSection1TableViewCell.swift
//  PlayerProfile
//
//  Created by ARYAN SINGHAL on 13/02/25.
//

import UIKit

class PlayerSection1TableViewCell: UITableViewCell {

    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerSkillLevel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updatePlayerInfo(with indexPath: IndexPath) {
        playerImageView.image = UIImage(named: DataController.userData[indexPath.row].profilePicture)
        playerImageView.layer.cornerRadius = playerImageView.frame.size.width / 2

        playerImageView.clipsToBounds = true
        playerNameLabel.text = DataController.userData[indexPath.row].name
        playerSkillLevel.text = DataController.userData[indexPath.row].name
        
        
    }
    
}
