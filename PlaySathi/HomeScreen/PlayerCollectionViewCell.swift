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
        playerImage.image = UIImage(named: DataController.userData[indexPath.row].profilePicture)
        playerImage.layer.cornerRadius = playerImage.bounds.width/2
        playerName.text = DataController.userData[indexPath.row].name
        playerDistance.text = "Distance ~ " + DataController.userData[indexPath.row].distance.formatted() + " kms"
        playerEP.text = " | " +  DataController.userData[indexPath.row].elitePoints.formatted() + " EP"
    }
}
