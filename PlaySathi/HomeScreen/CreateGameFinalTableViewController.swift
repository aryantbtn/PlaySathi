//
//  CreateGameFinalTableViewController.swift
//  PlaySathi
//
//  Created by Batch - 2 on 30/01/25.
//

import UIKit

class CreateGameFinalTableViewController: UITableViewController {

    @IBOutlet weak var venueName1: UILabel!
    @IBOutlet weak var dateUpdate: UILabel!
    @IBOutlet weak var player: UILabel!
    
    var venueN : String?
    var dateUp : String?
    var playerN : String?
    var priceN : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        venueName1.text = venueN
            dateUpdate.text = dateUp
        player.text = playerN
      
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      switch section {
        case 0:
            return 2
        case 1:
            return 2
        case 2:
            return 1
      
        default:
            return 1
        }
    }

    @IBAction func createGameConfirmTapped(_ sender: Any) {
        if listOfSections.contains(.gameCreated) {
            self.navigationController?.popToRootViewController(animated: true)
        } else {
            listOfSections.insert(.gameCreated, at: 1)
            DataController.headers[.gameCreated] = "Created Game"
            self.navigationController?.popToRootViewController(animated: true)
        }
        
    }
}
