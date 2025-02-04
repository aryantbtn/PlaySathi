//
//  VenueFinalDetailTableViewController.swift
//  PlaySathi
//
//  Created by Batch - 2 on 22/01/25.
//

import UIKit

class VenueFinalDetailTableViewController: UITableViewController {
    
    var instance2 = ScreenNavigation.navigate
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
            case 0:
            return 2
        case 1:
            return 4
        case 2:
            return 2
        default:
            return 1
        }
    }

}

    


    @IBAction func confirmButtonTap(_ sender: Any) {
        if instance2.check == "isdp"{
            let storyboard = UIStoryboard(name: "tabPrince", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "createGame") as! CreateGameTableViewController

            self.navigationController?.popViewController(animated: true)
            self.navigationController?.popViewController(animated: true)
            self.navigationController?.popViewController(animated: true)
            self.navigationController?.popViewController(animated: true)
          
           
            
            
        }
        else{
            let storyboard = UIStoryboard(name: "tabPrince", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "homePage") as! HomeScreenViewController
            self.navigationController?.popViewController(animated: true)
            self.navigationController?.popViewController(animated: true)
            self.navigationController?.popViewController(animated: true)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    
        
        
    


