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
    var searchPlayer = [User]()
    var searching = false
    
//    players = ScreenData.userData
    var selecteddIndexPath: IndexPath?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Players"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        self.tabBarController?.isTabBarHidden = true
        
//        Configure Table View
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
        
//        Segmented Control
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
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("inside cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerList1TableViewCell
//        print("Cell for row")
        if searching {
            cell.playerNameLabel.text = searchPlayer[indexPath.row].name
        }
//        let player = players[indexPath.row]
        cell.upadateCell(with: indexPath)
        cell.showsReorderControl = true
        return cell
    }
    
    
    // MARK:- Search Bar Function
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
                searchPlayer = players.filter {$0.name.lowercased().contains(searchText.lowercased())}
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
                return
            case 1:
                // Sort by Distance (Example)
                players.sort { user1, user2 in
                    user1.distance < user2.distance
                }
            case 2:
                // Sort by EP (Example)
                players.sort { user1, user2 in
                    user1.elitePoints < user2.elitePoints
                }
            default:
                break
            }
            tableView.reloadData()
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("********")
        let destination = players[indexPath.row]
//        print(selecteddIndexPath)
        selecteddIndexPath = indexPath
        print(selecteddIndexPath)

        performSegue(withIdentifier: "segue1", sender: (Any).self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue1" {
            let destinationVC = segue.destination as! PlayerProfileTableViewController
            destinationVC.indexPathForPlayerProfile = selecteddIndexPath!
        }
    }
}
