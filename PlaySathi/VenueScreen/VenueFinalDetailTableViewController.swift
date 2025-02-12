//
//  VenueFinalDetailTableViewController.swift
//  PlaySathi
//
//  Created by Batch - 2 on 22/01/25.
//

import UIKit

class VenueFinalDetailTableViewController: UITableViewController {
    
    var instance2 = ScreenNavigation.navigate
    var indexPathForVenueFinal : IndexPath!
    var selectedDay : String = ""
    
    @IBOutlet var venueNameInFinal: UILabel!
    @IBOutlet var courtNumberInFinal: UILabel!
 
    @IBOutlet var dateInFinal: UILabel!
    @IBOutlet var timeInFinal: UILabel!
    @IBOutlet var priceInFinal: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return 2
        case 1:
            return 3
        case 2:
            return 2
        default:
            return 1
        }
    }
    
    func update (){
        venueNameInFinal.text = DataController.venueData[indexPathForVenueFinal.row].name
        priceInFinal.text = DataController.venueData[indexPathForVenueFinal.row].price.formatted()
        dateInFinal.text = selectedDay
    }
    
    
    
    
    @IBAction func confirmButtonTap(_ sender: Any) {
        if instance2.check == "isdp"{
//            let storyboard = UIStoryboard(name: "tabPrince", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "createGame") as! CreateGameTableViewController
//            vc.venueNmae = DataController.venueData[indexPathForVenueFinal.row].name
            let targetVC = (navigationController?.viewControllers[1])!
            self.navigationController?.popToViewController(targetVC, animated: true)
            if let destVC = navigationController?.viewControllers[1] as? CreateGameTableViewController {
                destVC.venueNmae = DataController.venueData[indexPathForVenueFinal.row].name
            }
            
        }
        else{
            listOfSections.insert(.venueBooked, at: 1)
            DataController.headers[.venueBooked] = "Court Locked"
//            if homeScreenSections.count == 3 {
//                homeScreenSections.insert("venuee", at: 1)
//            }
//            else if homeScreenSections.count == 4 {
//                if homeScreenSections.contains("venuee"){
//                    
//                } else {
//                    homeScreenSections.insert("venuee",at:2)
//                }
//            }
//             else if homeScreenSections.count == 5{
//                 if homeScreenSections.contains("venuee"){
//                     
//                 } else {
//                     homeScreenSections.insert("venuee",at:3)
//                 }
//                }
//            else {
//                
//            }
            let storyboard = UIStoryboard(name: "tabPrince", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "homePage") as! HomeScreenViewController
            vc.selectedIndexPath = indexPathForVenueFinal
            
            self.navigationController?.popToRootViewController(animated: true)
            
        }
    }
    
    
}
        
        
    


