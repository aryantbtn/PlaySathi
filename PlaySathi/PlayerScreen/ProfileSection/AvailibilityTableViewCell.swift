//
//  AvailibilityTableViewCell.swift
//  PlaySathi
//
//  Created by ARYAN SINGHAL on 02/03/25.
//

import UIKit

class AvailibilityTableViewCell: UITableViewCell {

    @IBOutlet weak var availableDay1: UILabel!
    @IBOutlet weak var availableDay2: UILabel!
    @IBOutlet weak var day1Time: UILabel!
    @IBOutlet weak var day2Time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func update(with indexPath: IndexPath) {
        availableDay1.text = "Sun"
        availableDay2.text = "Mon"
        day1Time.text = "06:00 PM"
        day2Time.text = "10:00 AM"
    }
    
}
