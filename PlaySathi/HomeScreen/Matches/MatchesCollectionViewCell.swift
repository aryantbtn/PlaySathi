//
//  MatchesCollectionViewCell.swift
//  PlaySathi
//
//  Created by Mac on 10/02/25.
//

import UIKit
protocol MatchesCollectionViewCellDelegate: AnyObject {
    func didTapCell()
}


class MatchesCollectionViewCell: UICollectionViewCell {

    
    weak var delegate: MatchesCollectionViewCellDelegate?
    
    @IBOutlet weak var host: UIImageView!
    @IBOutlet weak var player: UIImageView!
    static let identifier = String(describing: MatchesCollectionViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Add tap gesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc private func cellTapped() {
            delegate?.didTapCell()
        }
    
    func dispaly3(with indexPath: IndexPath){
        host.layer.cornerRadius = host.bounds.width/2
        host.layer.borderWidth = 2
        host.layer.borderColor = UIColor.accent.cgColor
        player.layer.cornerRadius = host.bounds.width/2
        player.layer.borderWidth = 2
        player.layer.borderColor = UIColor.accent.cgColor
    }

}
