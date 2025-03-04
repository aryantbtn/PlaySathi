//
//  LiveCollectionViewCell.swift
//  PlaySathi
//
//  Created by Mac on 04/03/25.
//

import UIKit

class LiveCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: LiveCollectionViewCell.self)
    func di(with indexPath: IndexPath){
        
    }

    @IBAction func scoreButtontapped(_ sender: Any) {
        NotificationCenter.default.post(
                   name: NSNotification.Name("ShowScoreboard"),
                   object: nil
               )
    }
    
}
