//
//  HomeScreenCollectionViewCell.swift
//  PlaySathi
//
//  Created by Batch - 2 on 15/01/25.
//

import UIKit
import Foundation

class HomeScreenCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: HomeScreenCollectionViewCell.self)
    
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var connectLabel: UILabel!
    @IBOutlet weak var bannerImage: UIImageView!

    func createGameCard (with indexPath: IndexPath){
        connectLabel.text = "Start Your Game"
        startLabel.text = "Connect with players nearby and schedule your match"
        bannerImage.image = UIImage(named: "Unknown 1")
    }
}
