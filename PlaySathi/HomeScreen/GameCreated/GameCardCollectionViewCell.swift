//
//  GameCardCollectionViewCell.swift
//  PlaySathi
//
//  Created by Batch - 2 on 31/01/25.
//

import UIKit

class GameCardCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: GameCardCollectionViewCell.self)
    

    @IBOutlet weak var dateAndTime: UILabel!
    @IBOutlet weak var venueName: UILabel!
    @IBOutlet weak var playerSelected: UIImageView!
    
    func game(with indexpath: IndexPath){
        playerSelected.layer.cornerRadius = playerSelected.bounds.width/2
        
    }
}
