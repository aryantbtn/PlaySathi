//
//  PlayerCollectionViewCell.swift
//  PlaySathi
//
//  Created by Batch - 2 on 15/01/25.
//

import UIKit

class PlayerCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: PlayerCollectionViewCell.self)
    
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerDistance: UILabel!
    @IBOutlet weak var playerEP: UILabel!
    
    
    func setup(with indexPath: IndexPath) {
        playerImage.image = UIImage(named: PlayerDataController.shared.userProfiles[indexPath.row].playerImage)
        playerName.text = PlayerDataController.shared.userProfiles[indexPath.row].name
        playerImage.layer.cornerRadius = playerImage.bounds.width/2
     playerImage.layer.borderWidth = 2
     playerImage.layer.borderColor = UIColor(red: 46/255, green: 107/255, blue: 101/255, alpha: 1).cgColor

//        playerDistance.text = "Distance ~ " + DataController.userData[indexPath.row].distance.formatted() + " kms"
//        playerEP.text = " | " +  DataController.userData[indexPath.row].elitePoints.formatted() + " EP"
    }
}
