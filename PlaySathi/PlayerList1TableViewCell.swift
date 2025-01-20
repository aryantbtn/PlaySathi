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
    
    
    @IBOutlet weak var chevronButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func upadateCell(with player: playerInfo) {
        print ("hello update")
        playerImageView.image = UIImage(named: player.playerImage)
        playerNameLabel.text = player.playerName
        playerDescription.text = player.description
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    @IBAction func chevronAction(_ sender: UIButton) {
        if chevronButton.isSelected {
            print("Chevron is tapped")
        }
    }
    
}
