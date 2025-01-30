//
//  SlotTableViewController.swift
//  PlaySathi
//
//  Created by Batch - 2 on 23/01/25.
//

import UIKit

class SlotTableViewController: UITableViewController {
    
    
    @IBOutlet var court1: UILabel!
    @IBOutlet var court3: UILabel!
    @IBOutlet var court2: UILabel!
    @IBOutlet var timeSlot3: UILabel!
    @IBOutlet var timeSlot2: UILabel!
    @IBOutlet var timeSlot1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dispaly()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
            case 0:
            return 1
        case 1:
            return 2
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
        court1.layer.cornerRadius = 10
        court1.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 240/255, alpha: 1)
        court1.clipsToBounds = true
        court1.textAlignment = .center
        
        court2.layer.cornerRadius = 10
        court2.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 240/255, alpha: 1)
        court2.clipsToBounds = true
        court2.textAlignment = .center
        
        court3.layer.cornerRadius = 10
        court3.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 240/255, alpha: 1)
        court3.clipsToBounds = true
        court3.textAlignment = .center
        
        timeSlot1.layer.cornerRadius = 10
        timeSlot1.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 240/255, alpha: 1)
        timeSlot1.clipsToBounds = true
        timeSlot1.textAlignment = .center
        
        timeSlot2.layer.cornerRadius = 10
        timeSlot2.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 240/255, alpha: 1)
        timeSlot2.clipsToBounds = true
        timeSlot2.textAlignment = .center
        
        timeSlot3.layer.cornerRadius = 10
        timeSlot3.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 240/255, alpha: 1)
        timeSlot3.clipsToBounds = true
        timeSlot3.textAlignment = .center
    }
   

}
