//
//  CreateGameTableViewController.swift
//  PlaySathi
//
//  Created by Batch - 2 on 17/01/25.
//

import UIKit

class CreateGameTableViewController: UITableViewController {
    
    @IBOutlet weak var date: UILabel!
    var instance = ScreenNavigation.navigate
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    @IBOutlet weak var venueName: UILabel! 
    @IBOutlet weak var playerName: UILabel!
    var venueNmae : String?
    var player : String?
    var dat: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Create Game"
        navigationItem.largeTitleDisplayMode = .never
        doneButton.isEnabled = false
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
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     switch section {
        case 0:
            return 1
        case 1:
         return 1
        case 2:
         return 4
        default:
            return 4
        }

        }
    override func viewWillAppear(_ animated: Bool) {
        venueName.text = venueNmae
        playerName.text = player
        date.text = dat
        tableView.reloadData()
        
        if ((venueName.text?.isEmpty) != nil) && ((playerName.text?.isEmpty) != nil){
            doneButton.isEnabled = true
        }
    }

    @IBAction func doneButtonTapped(_ sender: Any) {
        if listOfSections.contains(.gameCreated) {
            self.navigationController?.popToRootViewController(animated: true)
        } else {
            listOfSections.insert(.gameCreated, at: 1)
            DataController.headers[.gameCreated] = "Created Game"
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    }

