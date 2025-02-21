//
//  VenueFinalDetailTableViewController.swift
//  PlaySathi
//
//  Created by Batch - 2 on 22/01/25.
//

import UIKit

class VenueFinalDetailTableViewController: UITableViewController {
    
    var court = ""
    var instance2 = ScreenNavigation.navigate
    var indexPathForVenueFinal : IndexPath!
    var selectedDay : String = ""
    var selectedTime : String = ""
    
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
        timeInFinal.text = selectedTime
        courtNumberInFinal.text = court
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
                destVC.dat = selectedDay
            }
            
        }
        else{
            if listOfSections.contains(.venueBooked){
                self.navigationController?.popToRootViewController(animated: true)
            } else {
                listOfSections.insert(.venueBooked, at: 1)
                DataController.headers[.venueBooked] = "Court Booked"
                if let destVC = navigationController?.viewControllers[0] as? HomeScreenViewController {
                    destVC.vName = indexPathForVenueFinal
                    destVC.venueDateAndTimeForGameEntry = "\(selectedDay)  \(selectedTime)"
                self.navigationController?.popToRootViewController(animated: true)
                
                }
            }
        }
    }
    
    
}
        
        
    


