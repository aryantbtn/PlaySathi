//
//  UserProfileTableViewController.swift
//  PlaySathi
//
//  Created by Mac on 05/02/25.
//

import UIKit

class UserProfileTableViewController: UITableViewController {
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var numberOfMatches: UILabel!
    @IBOutlet weak var skillLevel: UILabel!
    
    @IBOutlet weak var elitePoints: UILabel!
    @IBOutlet weak var winRate: UILabel!
    @IBOutlet weak var image: UIImageView!
    private var userProfile :  Profile?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Load profile image from UserDefaults
        if let imageData = UserDefaults.standard.data(forKey: "Image 5"),
           let savedImage = UIImage(data: imageData) {
            image.image = savedImage
            image.layer.cornerRadius = image.bounds.width / 2
            image.clipsToBounds = true
            image.layer.borderWidth = 2
            image.layer.borderColor = UIColor.accent.cgColor
        }
        
        Task {
            name.text = await PlayerTableManager.shared.fetchCurrentUser()?.name
            skillLevel.text = await PlayerTableManager.shared.fetchCurrentUser()?.skillLevel
           elitePoints.text = "0"
            winRate.text = "0"
            numberOfMatches.text = "0"
        }
    }

        
     
    
    override func numberOfSections(in tableView: UITableView) -> Int {

        // #warning Incomplete implementation, return the number of sections
        return 5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 2
        case 3:
            return 3
        case 4:
            return 1
        default:
            return 1
        }
    }

    
    // Override to support conditional rearranging of the table view.



    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func viewWillAppear(_ animated: Bool) {
        image.layer.cornerRadius = image.bounds.width / 2
    }

    

}
