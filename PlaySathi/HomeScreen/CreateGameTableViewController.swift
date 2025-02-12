//
//  CreateGameTableViewController.swift
//  PlaySathi
//
//  Created by Batch - 2 on 17/01/25.
//

import UIKit

class CreateGameTableViewController: UITableViewController {
    
    var instance = ScreenNavigation.navigate
    
    
    @IBOutlet weak var venueName: UILabel! 
    @IBOutlet weak var playerName: UILabel!
    var venueNmae : String?
    var player : String? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Create Game"
        navigationItem.largeTitleDisplayMode = .never
        
    }
    

    
    @IBAction func goToVenue(_ sender: UIButton) {
        instance.check = "isdp"
        let storyBoard = UIStoryboard(name: "tabVishwajeet", bundle: nil)
        
        if let venueVC = storyBoard.instantiateViewController(withIdentifier: "venueId") as? VenueListViewController {
            self.navigationController?.pushViewController(venueVC, animated: true)
        }
    }
    @IBAction func selectPlayer(_ sender: UIButton) {
        instance.check = "players1"
        let storyBoard = UIStoryboard(name: "tabAryan", bundle: nil)
        if let playerVC = storyBoard.instantiateViewController(withIdentifier: "playerId") as? PlayerList1ViewController {
            self.navigationController?.pushViewController(playerVC, animated: true)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     switch section {
        case 0:
            return 2
        default:
            return 4
        }

        }
    override func viewWillAppear(_ animated: Bool) {
        venueName.text = venueNmae
        playerName.text = player
        tableView.reloadData()
    }

    }

