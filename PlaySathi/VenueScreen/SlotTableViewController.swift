//
//  SlotTableViewController.swift
//  PlaySathi
//
//  Created by Batch - 2 on 23/01/25.
//

import UIKit

class SlotTableViewController: UITableViewController {
    
    var indexPathForSlotSection : IndexPath?
    
    @IBOutlet var venueNameInSlotSection: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        dispaly()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
            case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
            case 3:
            return 1
            case 4:
            return 1
        default:
            return 1
        }
    }
    func dispaly(){
        venueNameInSlotSection.text = DataController.venueData[indexPathForSlotSection!.row].name
    }
   
    @IBAction func goToFinal(_ sender: Any) {
        let storyboard = UIStoryboard(name: "tabVishwajeet", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "final") as! VenueFinalDetailTableViewController
        vc.indexPathForVenueFinal = indexPathForSlotSection
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
