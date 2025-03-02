//
//  UserProfileTableViewController.swift
//  PlaySathi
//
//  Created by Mac on 05/02/25.
//

import UIKit

class UserProfileTableViewController: UITableViewController {
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var skillLevel: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    private var userProfile :  Profile?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageData = UserDefaults.standard.data(forKey: "userProfileImage"),
           let savedImage = UIImage(data: imageData) {
            image.image = savedImage
            
            Task {
                name.text =  await PlayerTableManager.shared.fetchCurrentUser()?.name
                skillLevel.text = await PlayerTableManager.shared.fetchCurrentUser()?.skillLevel
                
            }
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    override func viewWillAppear(_ animated: Bool) {
        image.layer.cornerRadius = image.bounds.width / 2
    }
}
