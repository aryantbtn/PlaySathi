//
//  CreateGameTableViewController.swift
//  PlaySathi
//
//  Created by Batch - 2 on 17/01/25.
//

import UIKit

class CreateGameTableViewController: UITableViewController {
    
    
    
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var venueName: UILabel!
    @IBOutlet weak var endTime: UIDatePicker!
    @IBOutlet weak var startTime: UIDatePicker!
    @IBOutlet weak var playerName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Create Game"
        venueName.text = newCreatedGame.venue.name
        navigationItem.largeTitleDisplayMode = .never

    }

    
    @IBAction func goToVenue(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "tabVishwajeet", bundle: nil)
        
        if let venueVC = storyBoard.instantiateViewController(withIdentifier: "venueId") as? VenueListViewController {
            self.navigationController?.pushViewController(venueVC, animated: true)
        }
    }
    
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
     switch section {
        case 0:
            return 2
        default:
            return 4
        }
        }
    
    }

   

