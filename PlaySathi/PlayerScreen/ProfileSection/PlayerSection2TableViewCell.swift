//
//  PlayerSection2TableViewCell.swift
//  PlayerProfile
//
//  Created by ARYAN SINGHAL on 13/02/25.
//

import UIKit

class PlayerSection2TableViewCell: UITableViewCell {

    @IBOutlet weak var matchPlayed: UILabel!
    @IBOutlet weak var winRate: UILabel!
    @IBOutlet weak var elitePointEarned: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updatePlayerMatchStats(with indexPath: IndexPath) {
        matchPlayed.text = "15"
        winRate.text = "80"
        elitePointEarned.text = String(DataController.userData[indexPath.row].elitePoints)
    }
    
}
