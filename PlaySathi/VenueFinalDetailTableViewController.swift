//
//  VenueFinalDetailTableViewController.swift
//  PlaySathi
//
//  Created by Batch - 2 on 22/01/25.
//

import UIKit

class VenueFinalDetailTableViewController: UITableViewController {
var createGameTableViewController: CreateGameTableViewController?
    
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


//    @IBAction func goToCreateGame(_ sender: Any) {
//            let storyBoard = UIStoryboard(name: "tabPrince", bundle: nil)
//        let venueVC = storyBoard.instantiateViewController(identifier: "CreateGame") as! CreateGameTableViewController
//        
//        self.navigationController?.pushViewController(venueVC, animated: true)
//        
//        if let venueVC = storyBoard.instantiateViewController(withIdentifier: "CreateGame") as? CreateGameTableViewController {
//                self.navigationController?.pushViewController(venueVC, animated: true)
//            createGameTableViewController?.venueName.text = "Say No To Stress"
//            }
    
    }
        
        
    

