//
//  CreateGameTableViewController.swift
//  PlaySathi
//
//  Created by Batch - 2 on 17/01/25.
//

import UIKit

class CreateGameTableViewController: UITableViewController {
   
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var venueName: UILabel! 
    @IBOutlet weak var playerName: UILabel!
    
    var instance = ScreenNavigation.navigate
    var venueNmae : String?
    var player : String?
    var selectedDate: String?
    var selectedTime: String?
    var indexPath : Int?
    
    
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
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     switch section {
        
        case 0:
         return 1
        case 1:
         return 4
        default:
            return 4
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        venueName.text = venueNmae
        playerName.text = player
        date.text = selectedDate
        time.text = selectedTime
        tableView.reloadData()
        
        if ((venueName.text?.isEmpty) != nil) && ((playerName.text?.isEmpty) != nil){
            doneButton.isEnabled = true
        }
    }

    @IBAction func doneButtonTapped(_ sender: Any) {
        if listOfSections.contains(.gameCreated) {
            self.navigationController?.popToRootViewController(animated: true)
        } else {
            if let destVC = navigationController?.viewControllers[0] as? HomeScreenViewController {
                // Setup game card info
                destVC.venueNameForGameCard = venueNmae
                destVC.dateForGameCard = selectedDate
                destVC.timeForGameCard = selectedTime
                destVC.playerforGameCard = PlayerDataController.shared.userProfiles[5].playerImage
                listOfSections.insert(.gameCreated, at: 1)
                DataController.headers[.gameCreated] = "Created Game"
                
                // First transition after 5 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                    // Send first notification
                    NotificationCenter.default.post(
                        name: Notification.Name("GameNotification"),
                        object: nil,
                        userInfo: ["message": "Your game request has been accepted!"]
                    )
                    
                    if let index = listOfSections.firstIndex(of: .gameCreated) {
                        listOfSections.remove(at: index)
                        listOfSections.insert(.matches, at: index)
                        DataController.headers[.matches] = "Matches"
                        destVC.collectionView.reloadData()
                        
                        
                        // Second transition after another 5 seconds
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                            // Send second notification
                            NotificationCenter.default.post(
                                name: Notification.Name("GameNotification"),
                                object: nil,
                                userInfo: ["message": "Your game is now live!"]
                            )
                            
                            if let matchIndex = listOfSections.firstIndex(of: .matches) {
                                listOfSections.remove(at: matchIndex)
                                listOfSections.insert(.live, at: matchIndex)
                                DataController.headers[.live] = "Matches"
                                destVC.collectionView.reloadData()
                            }
                        }
                    }
                    
                }


                
               
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }

}

