//
//  CreateGameFinalTableViewController.swift
//  PlaySathi
//
//  Created by Batch - 2 on 30/01/25.
//

import UIKit

class CreateGameFinalTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      switch section {
        case 0:
            return 2
        case 1:
            return 4
        case 2:
            return 1
      case 3:
          return 2
        default:
            return 1
        }
    }

    @IBAction func createGameConfirmTapped(_ sender: Any) {
        if homeScreenSections.count == 3 {
            homeScreenSections.insert("create", at: 1)
        }
        else if homeScreenSections.count == 4 {
            if homeScreenSections.contains("create"){
                
            } else {
                homeScreenSections.insert("create",at:2)
            }
        }
         else if homeScreenSections.count == 5{
             if homeScreenSections.contains("create"){
                 
             } else {
                 homeScreenSections.insert("create",at:3)
             }
            }
        else {
            
        }
        let storyboard = UIStoryboard(name: "tabPrince", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "homePage") as! HomeScreenViewController
        self.navigationController?.popToRootViewController(animated: true)
    }
    

}
