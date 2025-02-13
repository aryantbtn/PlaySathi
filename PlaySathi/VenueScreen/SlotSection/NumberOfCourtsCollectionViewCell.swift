//
//  NumberOfCourtsCollectionViewCell.swift
//  PlaySathi
//
//  Created by Batch - 2 on 11/02/25.
//

import UIKit

class NumberOfCourtsCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: NumberOfCourtsCollectionViewCell.self)
    @IBOutlet var courtLabel: UILabel!
    override func awakeFromNib() {
           super.awakeFromNib()
           courtLabel.textAlignment = .center
       }

}
