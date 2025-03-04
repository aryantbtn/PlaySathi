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
    }
    
    func updatePlayerInfo(with indexPath: IndexPath) {
        playerImageView.image = UIImage(named: PlayerDataController.shared.userProfiles[indexPath.row].playerImage)
        playerImageView.layer.cornerRadius = playerImageView.frame.size.width / 2
        playerImageView.layer.borderWidth = 3
        playerImageView.layer.borderColor = UIColor(red: 46/255, green: 107/255, blue: 101/255, alpha: 1).cgColor
        playerImageView.clipsToBounds = true
        playerNameLabel.text = PlayerDataController.shared.userProfiles[indexPath.row].name
        playerSkillLevel.text = PlayerDataController.shared.userProfiles[indexPath.row].skillLevel
    }
    
}
