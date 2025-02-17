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
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var courtsCollectionView: UICollectionView!
    @IBOutlet var timeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlotCollectionView()
        setupCollectionView()
        datePicker.minimumDate = Date()
        dispaly()
    }
    // MARK: - Table view data source
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 4
//    }
//   
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch section {
//            case 0, 1, 2, 3:
//            return 1
//        default:
//            return 0
//        }
//    }
    func dispaly(){
        venueNameInSlotSection.text = DataController.venueData[indexPathForSlotSection!.row].name
    }
   
    @IBAction func goToFinal(_ sender: Any) {
        let storyboard = UIStoryboard(name: "tabVishwajeet", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "final") as! VenueFinalDetailTableViewController
        vc.indexPathForVenueFinal = indexPathForSlotSection
        
        vc.selectedDay = "\(datePicker.date.formatted(.dateTime.day().month().year()))"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupCollectionView() {
        let nib = UINib(nibName: NumberOfCourtsCollectionViewCell.identifier, bundle: nil)
        courtsCollectionView.register(nib, forCellWithReuseIdentifier: NumberOfCourtsCollectionViewCell.identifier)
        courtsCollectionView.delegate = self
        courtsCollectionView.dataSource = self
        
        if let flowLayout = courtsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumInteritemSpacing = 6
            flowLayout.minimumLineSpacing = 5
            flowLayout.itemSize = CGSize(width: 100, height: 40)
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        }
    }
    func setupSlotCollectionView() {
        let nib = UINib(nibName: AvailableTimeSlotCollectionViewCell.identifier, bundle: nil)
        timeCollectionView.register(nib, forCellWithReuseIdentifier: AvailableTimeSlotCollectionViewCell.identifier)
        timeCollectionView.delegate = self
        timeCollectionView.dataSource = self
        
        if let flowLayout = timeCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumInteritemSpacing = 6
            flowLayout.minimumLineSpacing = 5
            flowLayout.itemSize = CGSize(width: 100, height: 40)
            flowLayout.sectionInset = UIEdgeInsets(top:0 , left: 10, bottom: 0, right: 10)
        }
    }


}

// MARK: - UICollectionView DataSource & Delegate


extension SlotTableViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if collectionView == courtsCollectionView {
                print(DataController.venueData[indexPathForSlotSection!.row].numberOfCourts.count)
                return DataController.venueData[indexPathForSlotSection!.row].numberOfCourts.count
                
            } else if collectionView == timeCollectionView {
                print(DataController.venueData[indexPathForSlotSection!.row].timeSlots.count)
                return DataController.venueData[indexPathForSlotSection!.row].timeSlots.count
            }
            return 0
        }
        
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //print(#function)
        //print(indexPath)
        //print(DataController.venueData[indexPath.row])
             if collectionView == timeCollectionView {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AvailableTimeSlotCollectionViewCell.identifier, for: indexPath) as? AvailableTimeSlotCollectionViewCell
                let timeSlots = DataController.venueData[indexPathForSlotSection!.row].timeSlots // Assuming availableTimeSlots data
                 //print(timeSlots)
               cell!.timeSlot.setTitle(timeSlots[indexPath.row], for: .normal)
                cell!.layer.cornerRadius = 8
                cell!.layer.borderWidth = 1
                cell!.layer.borderColor = UIColor.gray.cgColor
                cell!.backgroundColor = .systemGray
                return cell!
            } else if collectionView == courtsCollectionView {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumberOfCourtsCollectionViewCell.identifier, for: indexPath) as! NumberOfCourtsCollectionViewCell
                let courts = DataController.venueData[indexPathForSlotSection!.row].numberOfCourts
                //print(courts)
                //print(courts[indexPath.row])
               cell.courtOutlet.setTitle(courts[indexPath.row], for: .normal)
                cell.layer.cornerRadius = 8
                cell.layer.borderWidth = 1
                cell.layer.borderColor = UIColor.gray.cgColor
                cell.backgroundColor = .systemGray
                return cell
            }
            return UICollectionViewCell()
        }
    
    
}


