//
//  CollectionViewCell.swift
//  PlayerProfile
//
//  Created by ARYAN SINGHAL on 13/02/25.
//

import UIKit

class PlayerAchievementCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var achievementNameLabel: UILabel!
    @IBOutlet weak var achieveImageView: UIImageView!
    @IBOutlet weak var dateOfAchieve: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateAchievementInfo(achievement: Achievement) {
        achieveImageView.image = achievement.achieveImage
        achievementNameLabel.text = achievement.achieveName
        dateOfAchieve.text = achievement.dateOfAchievement
    }
}
