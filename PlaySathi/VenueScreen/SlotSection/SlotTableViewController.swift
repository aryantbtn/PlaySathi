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
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        datePicker.minimumDate = Date()
        dispaly()
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0, 1, 2, 3:
            return 1
        default:
            return 0
        }
    }
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
        let nib = UINib(nibName: "NumberOfCourtsCollectionViewCell", bundle: nil)
        courtsCollectionView.register(nib, forCellWithReuseIdentifier: "CourtCell")
        courtsCollectionView.delegate = self
        courtsCollectionView.dataSource = self
        
        if let flowLayout = courtsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumInteritemSpacing = 10
            flowLayout.minimumLineSpacing = 10
            flowLayout.itemSize = CGSize(width: 100, height: 40)
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        }
    }

}

// MARK: - UICollectionView DataSource & Delegate

extension SlotTableViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return DataController.venueData[indexPathForSlotSection!.row].numberOfCourts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourtCell", for: indexPath) as? NumberOfCourtsCollectionViewCell
        
    
        let courts = DataController.venueData[indexPathForSlotSection!.row].numberOfCourts
            cell!.courtLabel.text = courts[indexPath.row]
            cell!.layer.cornerRadius = 8
            cell!.layer.borderWidth = 1
            cell!.layer.borderColor = UIColor.gray.cgColor
            cell!.backgroundColor = .systemGray
        
        return cell!
    }
}
