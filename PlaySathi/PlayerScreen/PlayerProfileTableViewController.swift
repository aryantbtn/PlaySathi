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

            self.navigationController?.popViewController(animated: true)
            self.navigationController?.popViewController(animated: true)
            
        
            
        }
        else{
            let storyboard = UIStoryboard(name: "tabPrince", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "homePage") as! HomeScreenViewController
          
            self.navigationController?.popViewController(animated: true)
            self.navigationController?.popViewController(animated: true)

        }
    }
    
}
