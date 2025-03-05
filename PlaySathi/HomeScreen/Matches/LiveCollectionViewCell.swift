//
//  LiveCollectionViewCell.swift
//  PlaySathi
//
//  Created by Mac on 04/03/25.
//

import UIKit

class LiveCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: LiveCollectionViewCell.self)
    
    
    @IBOutlet weak var host: UIImageView!
    @IBOutlet weak var player: UIImageView!
    
    func di(with indexPath: IndexPath){
        host.layer.borderWidth = 2
        host.layer.borderColor = UIColor.accent.cgColor
        host.layer.cornerRadius = host.bounds.width/2
        player.layer.cornerRadius = player.bounds.width/2
        player.layer.borderWidth = 2
        player.layer.borderColor = UIColor.accent.cgColor
    }

    @IBAction func scoreButtontapped(_ sender: Any) {
        NotificationCenter.default.post(
                   name: NSNotification.Name("ShowScoreboard"),
                   object: nil
               )
    }
    
}
