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
        playerImage.image = UIImage(named: ScreenData.userData[indexPath.row].profilePicture)
        playerName.text = ScreenData.userData[indexPath.row].name
        playerDistance.text = "Distance ~ " + ScreenData.userData[indexPath.row].location.formatted() + " kms"
        playerEP.text = " | " +  ScreenData.userData[indexPath.row].elitePoints.formatted() + " EP"
    }
}
