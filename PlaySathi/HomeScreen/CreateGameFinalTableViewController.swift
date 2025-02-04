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

    

}
