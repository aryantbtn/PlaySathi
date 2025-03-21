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
        playerImageView.image = UIImage(named: PlayerDataController.shared.userProfiles[indexPath.row].playerImage)
        playerImageView.layer.cornerRadius = playerImageView.bounds.width / 2
        playerImageView.layer.borderWidth = 2
        playerImageView.layer.borderColor = UIColor(red: 46/255, green: 107/255, blue: 101/255, alpha: 1).cgColor
        
        playerNameLabel.text = PlayerDataController.shared.userProfiles[indexPath.row].name
        playerDescription.text = "Available  \(PlayerDataController.shared.userProfiles[indexPath.row].availableTime)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

   
    
}
