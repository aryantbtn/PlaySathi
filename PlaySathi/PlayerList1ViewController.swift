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
    var searchPlayer = [playerInfo]()
    var searching = false
    
    var players = [playerInfo(playerImage:"Image 2", playerName: "Umesh Gaur", description: "Distance ~ 30 Kms | 230 EP"),
                   playerInfo(playerImage: "Image 3", playerName: "Rishabh Rathore", description: "Distance ~ 9.4 Kms | 98 EP"),
                   playerInfo(playerImage:  "Image 4", playerName: "Rohit Dixit", description: "Distance ~ 6 Kms | 109 EP"),
                   playerInfo(playerImage: "Image 5", playerName: "Aditya Sharma", description: "Distance ~ 17 Kms | 100 EP"),
                   playerInfo(playerImage: "Image 6", playerName: "Aniket Mishra", description: "Distance ~ 7.8 Kms | 140 EP"),
                   playerInfo(playerImage:  "Image 7", playerName: "Harsh Dixit", description: "Distance ~ 34 Kms | 300 EP"),
                   playerInfo(playerImage:  "Image 8", playerName: "Umesh Gaur", description: "Distance ~ 30 Kms | 230 EP"),
                   playerInfo(playerImage:  "images9", playerName: "Piyush Mauriya", description: "Distance ~ 7.2 Kms | 100 EP"),
                   playerInfo(playerImage:  "images10", playerName: "Utkarsh Verma", description: "Distance ~ 6.3 Kms | 276 EP"),
                   playerInfo(playerImage:  "images11", playerName: "Aman Verma", description: "Distance ~ 5.2 Kms | 147 EP"),
                   playerInfo(playerImage: "Image 5", playerName: "Vishu Sharma", description: "Distance ~ 13 Kms | 100 EP"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Players"
                navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
                searchController.obscuresBackgroundDuringPresentation = false
                searchController.searchResultsUpdater = self
        
                
                // Configure Table View
                tableView.delegate = self
                tableView.dataSource = self
                
                // Segmented Control
                playerListSegmetedControl.addTarget(self, action:
                #selector(segmentValueChanged(_:)), for: .valueChanged)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchPlayer.count
        }
        else {
            return players.count
        }
//        print(players.count)
//        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("inside cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerList1TableViewCell
//        print("Cell for row")
        if searching {
            cell.playerNameLabel.text = searchPlayer[indexPath.row].playerName
        }
        let player = players[indexPath.row]
        cell.upadateCell(with: player)
        cell.showsReorderControl = true
        print(player)
        return cell
    }
    
    
    // MARK:- Search Bar Function
    
    func updateSearchResults(for searchController: UISearchController) {
            if let searchText = searchController.searchBar.text, !searchText.isEmpty {
                searchPlayer = players.filter { $0.playerName.lowercased().contains(searchText.lowercased()) }
                searching = true
            } else {
                searching = false
            }
            tableView.reloadData()
    }
    
//    MARK:- Segmented Control
    @objc func segmentValueChanged(_ sender: UISegmentedControl) {
            switch sender.selectedSegmentIndex {
            case 0:
                // Sort by Distance (Example)
                players.sort { $0.description < $1.description }
            case 1:
                // Sort by EP (Example)
                players.sort { $0.description.split(separator: "|")[1] < $1.description.split(separator: "|")[1] }
            default:
                break
            }
            tableView.reloadData()
        }
}
