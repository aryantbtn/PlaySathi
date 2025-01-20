//
//  HomeScreenCollectionViewCell.swift
//  PlaySathi
//
//  Created by Batch - 2 on 15/01/25.
//

import UIKit

class HomeScreenCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: HomeScreenCollectionViewCell.self)
    
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var BannerImage: UIImageView!

    
    func dispaly (with indexPath: IndexPath){
        Label1.text = "Start Your Game"
        
        
        Label2.text = "Connect with players nearby and schedule your match"

        BannerImage.image = UIImage(named: "Unknown 1")
    }
}
