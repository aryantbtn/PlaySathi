//
//  PlayerList1ViewController.swift
//  PlaySathi
//
//  Created by Batch - 2 on 20/01/25.
//

import UIKit

class PlayerList1ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    @IBOutlet weak var playerListSegmetedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController()
    var searchPlayer = PlayerDataController.shared.userProfiles
    var searching = false
    var selectedIndexPath: IndexPath?
       
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Players"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
           
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
        
        playerListSegmetedControl.addTarget(self, action: #selector(segmentValueChanged(_:)), for: .valueChanged)
        view.layoutIfNeeded()
    }
       
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchPlayer.count
        }
        else {
            return PlayerDataController.shared.userProfiles.count
        }
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("inside cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerList1TableViewCell
        if searching {
               let player = searchPlayer[indexPath.row]
               cell.playerNameLabel.text = player.name
            cell.playerImageView.image = UIImage(named: player.playerImage)
            cell.playerDescription.text = "Available: \(player.availableTime)"
        } else {
            cell.upadateCell(with: indexPath)
        }
                   
        cell.showsReorderControl = true
        return cell
    }
       
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {
            searching = false
            tableView.reloadData()
            return
        }
        
        if searchText.isEmpty {
            searching = false
            searchPlayer = []
        } else {
            searching = true
            searchPlayer = PlayerDataController.shared.userProfiles.filter { player in
                player.name.lowercased().contains(searchText.lowercased())
            }
        }
        tableView.reloadData()
        
    }
       
    @objc func segmentValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            PlayerDataController.shared.userProfiles.sort { user1, user2 in
                user1.name < user2.name
            }
        case 1:
            PlayerDataController.shared.userProfiles.sort { user1, user2 in
                user1.elitePoint < user2.elitePoint
            }
        case 2:
            PlayerDataController.shared.userProfiles.sort { user1, user2 in
                user1.elitePoint < user2.elitePoint
            }
                
        default:
            break
        }
        tableView.reloadData()
    }
       
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destination = PlayerDataController.shared.userProfiles[indexPath.row]
        selectedIndexPath = indexPath
        print(selectedIndexPath as Any)

        performSegue(withIdentifier: "segue1", sender: (Any).self)
    }
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue1" {
            let destinationVC = segue.destination as! PlayerProfileViewController
            destinationVC.indexPathForPlayerProfile = selectedIndexPath!
        }
    }
}
