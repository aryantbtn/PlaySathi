//
//  PlayerProfileTableViewController.swift
//  PlaySathi
//
//  Created by Batch - 2 on 22/01/25.
//

import UIKit

class PlayerProfileTableViewController: UITableViewController {

    
    var  instance4 = ScreenNavigation.navigate
    
    @IBOutlet weak var elitePoints: UILabel!
    @IBOutlet weak var winRate: UILabel!
    @IBOutlet weak var matchPlayed: UILabel!
    @IBOutlet weak var playerProfileName: UILabel!
    @IBOutlet weak var playerProfileImage: UIImageView!
    
    var indexPathForPlayerProfile : IndexPath = IndexPath()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        display(with: indexPathForPlayerProfile)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    func display (with indexPath : IndexPath){
        playerProfileImage.image = UIImage(named: DataController.userData[indexPath.row].profilePicture)
        playerProfileImage.layer.cornerRadius = playerProfileImage.bounds.width / 2
        playerProfileName.text = DataController.userData[indexPath.row].name
        
    }
    

    @IBAction func goToCreatGame(_ sender: Any) {
        let storyboard = UIStoryboard(name: "tabPrince", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "createGame") as! CreateGameTableViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func inviteButtonTapped(_ sender: Any) {
        if instance4.check == "players1"{
            let storyboard = UIStoryboard(name: "tabPrince", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "createGame") as! CreateGameTableViewController
            let targetVC = (navigationController?.viewControllers[1])!
            self.navigationController?.popToViewController(targetVC, animated: true)
            
            
        
            
        }
        else{
            if homeScreenSections.count == 3 {
                homeScreenSections.insert("playerss", at: 1)
            }
            else if homeScreenSections.count == 4 {
                if homeScreenSections.contains("playerss"){
                    
                } else {
                    homeScreenSections.insert("playerss",at:2)
                }
            }
             else if homeScreenSections.count == 5{
                 if homeScreenSections.contains("playerss"){
                     
                 } else {
                     homeScreenSections.insert("playerss",at:3)
                 }
                }
            else {
                
            }
            let storyboard = UIStoryboard(name: "tabPrince", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "homePage") as! HomeScreenViewController
          
            self.navigationController?.popToRootViewController(animated: true)
            

        }
    }
    
}
