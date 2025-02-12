//
//  NotificationTableViewController.swift
//  PlaySathi
//
//  Created by Batch - 2 on 12/02/25.
//

import UIKit

class NotificationTableViewController: UITableViewController {
    
    @IBOutlet weak var senderImage: UIImageView!
    
    @IBOutlet weak var message: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
        
    }

    
}
