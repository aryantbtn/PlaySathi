//
//  GameCardCollectionViewCell.swift
//  PlaySathi
//
//  Created by Batch - 2 on 31/01/25.
//

import UIKit

class GameCardCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: GameCardCollectionViewCell.self)

    @IBOutlet weak var host: UIImageView!
    @IBOutlet weak var dateAndTime: UILabel!
    @IBOutlet weak var venueName: UILabel!
    @IBOutlet weak var playerSelected: UIImageView!
    
    func updateCreateGame(with indexpath: IndexPath){
        playerSelected.layer.cornerRadius = playerSelected.bounds.width/2
        playerSelected.image  = UIImage(named : PlayerDataController.shared.userProfiles[indexpath.row].playerImage)
        playerSelected.layer.borderWidth = 2
        playerSelected.layer.borderColor = UIColor(red: 46/255, green: 107/255, blue: 101/255, alpha: 1).cgColor
        host.layer.borderWidth = 2
        host.layer.borderColor = UIColor(red: 46/255, green: 107/255, blue: 101/255, alpha: 1).cgColor
        host.layer.cornerRadius = host.bounds.width/2
    }
}
