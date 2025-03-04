//
//  PlayerProfileTableViewController.swift
//  PlaySathi
//
//  Created by Batch - 2 on 22/01/25.
//

import UIKit

class PlayerProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var playerInfoTableView: UITableView!
    
    var instance4 = ScreenNavigation.navigate
    var indexPathForPlayerProfile: IndexPath = IndexPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
        playerInfoTableView.reloadData()
    }
    
    func registerTableView() {
        let section1Nib = UINib(nibName: "PlayerSection1TableViewCell", bundle: nil)
        playerInfoTableView.register(section1Nib, forCellReuseIdentifier: "PlayerSection1TableViewCell")
     
        let section2Nib = UINib(nibName: "PlayerSection2TableViewCell", bundle: nil)
        playerInfoTableView.register(section2Nib, forCellReuseIdentifier: "PlayerSection2TableViewCell")
        
//        let section3Nib = UINib(nibName: "AvailibilityTableViewCell", bundle: nil)
//        playerInfoTableView.register(section3Nib, forCellReuseIdentifier: "AvailibilityTableViewCell")
        
        playerInfoTableView.delegate = self
        playerInfoTableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section  {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerSection1TableViewCell", for: indexPath) as! PlayerSection1TableViewCell
            cell.updatePlayerInfo(with: indexPathForPlayerProfile)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerSection2TableViewCell", for: indexPath) as! PlayerSection2TableViewCell
            cell.updatePlayerMatchStats(with: indexPathForPlayerProfile)
            return cell
//        case 2:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "AvailibilityTableViewCell", for: indexPath) as! AvailibilityTableViewCell
//            cell.update(with: indexPath)
//            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerSection1TableViewCell", for: indexPath) as! PlayerSection1TableViewCell
            cell.updatePlayerInfo(with: indexPathForPlayerProfile)
            return cell
        }
        
    }
    
    // MARK: - Table View Delegate Methods
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 200
            
        case 1:
            return 140
            
        default:
            return 0
        }
        
    }
    
    @IBAction func inviteButtonTapped(_ sender: Any) {
        if instance4.check == "players1" {
            let targetVC = (navigationController?.viewControllers[1])!
            self.navigationController?.popToViewController(targetVC, animated: true)
                    
            if let destVC = navigationController?.viewControllers[1] as? CreateGameTableViewController {
                destVC.player = PlayerDataController.shared.userProfiles[indexPathForPlayerProfile.row].name
                destVC.indexPath = indexPathForPlayerProfile.row
            }
                
        } else {
            if listOfSections.contains(.inviteSent) {
                self.navigationController?.popToRootViewController(animated: true)
            } else {
                listOfSections.insert(.inviteSent, at: 1)
                DataController.headers[.inviteSent] = "Invite Sent"
                if let destVC = navigationController?.viewControllers[0] as? HomeScreenViewController {
                    destVC.pName = indexPathForPlayerProfile
                }
                self.navigationController?.popToRootViewController(animated: true)
                        
            }
        }
    }
}


