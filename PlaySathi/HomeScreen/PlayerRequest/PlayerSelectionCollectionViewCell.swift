//
//  PlayerSelectionCollectionViewCell.swift
//  PlaySathi
//
//  Created by Batch - 2 on 24/01/25.
//

import UIKit

class PlayerSelectionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    static let identifier = String(describing: PlayerSelectionCollectionViewCell.self)
    
    func disp(with indexPath: IndexPath){
        image.image = UIImage(named: DataController.userData[indexPath.row].profilePicture)
        image.layer.cornerRadius = image.bounds.width/2
        image.layer.borderWidth = 2
        image.layer.borderColor = UIColor(red: 46/255, green: 107/255, blue: 101/255, alpha: 1).cgColor
        name.text = "\(DataController.userData[indexPath.row].name) | \(DataController.userData[indexPath.row].elitePoints) Elite Points"
    }
}


