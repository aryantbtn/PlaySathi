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
    var selectedTimeSlot = -1
    var selectedCourt = -1
    
    @IBOutlet var nextButton : UIBarButtonItem!
    
    // Add these new properties
     private var availableCourts: [String] = []
     private var selectedDate: Date?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlotCollectionView()
        setupCollectionView()
        datePicker.minimumDate = Date()
        dispaly()
        nextButton.isEnabled = false
        selectedDate = datePicker.date
        nextButtonState()
        // Hide courts collection view initially
        courtsCollectionView.isHidden = true
    }
    private func updateAvailableCourts(for timeSlot: String) {
        guard let venueIndex = indexPathForSlotSection?.row else { return }
        let venue = DataController.venueData[venueIndex]
        
        selectedCourt = -1
                
                // In a real app, you would check court availability from your data
                // For now, we'll show all courts as available
                availableCourts = venue.numberOfCourts
                
                courtsCollectionView.isHidden = false
                courtsCollectionView.reloadData()
                nextButtonState()
            }
    
            

  
    
    func nextButtonState() {
        // Button should be enabled only when both selections are made
                nextButton.isEnabled = selectedTimeSlot != -1 && selectedCourt != -1
                nextButton.tintColor = nextButton.isEnabled ? .systemBlue : .systemGray

        
    }
  
    func dispaly() {
        venueNameInSlotSection.text = DataController.venueData[indexPathForSlotSection!.row].name
    }
   
    @IBAction func goToFinal(_ sender: Any) {
        let storyboard = UIStoryboard(name: "tabVishwajeet", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "final") as! VenueFinalDetailTableViewController
        vc.indexPathForVenueFinal = indexPathForSlotSection
        vc.selectedTime = DataController.venueData[indexPathForSlotSection!.row].timeSlots[selectedTimeSlot]
        vc.court = DataController.venueData[indexPathForSlotSection!.row].numberOfCourts[selectedCourt]
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
            flowLayout.sectionInset = UIEdgeInsets(top:10 , left: 10, bottom: 0, right: 10)
        }
    }


}

// MARK: - UICollectionView DataSource & Delegate


extension SlotTableViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == courtsCollectionView {
            return availableCourts.count
        } else if collectionView == timeCollectionView {
            return DataController.venueData[indexPathForSlotSection!.row].timeSlots.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == timeCollectionView {
            // Existing time slot cell code remains the same
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AvailableTimeSlotCollectionViewCell.identifier, for: indexPath) as? AvailableTimeSlotCollectionViewCell
            let timeSlots = DataController.venueData[indexPathForSlotSection!.row].timeSlots
            cell?.venueIndex = indexPathForSlotSection?.row
            cell?.venueTimeSlotIndex = indexPath.row
            cell?.delegate = self
            cell?.timeSlot.setTitle(timeSlots[indexPath.row], for: .normal)
            cell?.selectedTimeSlot = self.selectedTimeSlot
            cell?.configureCell()
            cell?.layer.cornerRadius = 8
            cell?.layer.borderWidth = 1
            cell?.layer.borderColor = UIColor.gray.cgColor
            cell?.backgroundColor = .systemGray
            return cell!
        } else if collectionView == courtsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumberOfCourtsCollectionViewCell.identifier, for: indexPath) as! NumberOfCourtsCollectionViewCell
            cell.venueIndex = indexPathForSlotSection?.row
            cell.venueCourtIndex = indexPath.row
            cell.delegat = self
            cell.selectedCourt = self.selectedCourt
            cell.configure()
            cell.courtOutlet.setTitle(availableCourts[indexPath.row], for: .normal)
            cell.layer.cornerRadius = 8
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.gray.cgColor
            cell.backgroundColor = .systemGray
            return cell
        }
        return UICollectionViewCell()
    }
}



// Modify TimeSlotTableViewCellDelegate implementation
extension SlotTableViewController: TimeSlotTableViewCellDelegate {
    func timeSlotSelected(selectedTimeSlot: Int) {
        self.selectedTimeSlot = selectedTimeSlot
        if selectedTimeSlot != -1 {
            // Show courts when time is selected
            courtsCollectionView.isHidden = false
            // Get all courts for the venue
            availableCourts = DataController.venueData[indexPathForSlotSection!.row].numberOfCourts
        } else {
            // Hide courts when no time selected
            courtsCollectionView.isHidden = true
            availableCourts = []
        }
        timeCollectionView.reloadData()
        courtsCollectionView.reloadData()
        nextButtonState()
    }
}



extension SlotTableViewController:CourtTableViewCellDelegate {
    func courtSelected(selectedCourt: Int) {
        self.selectedCourt = selectedCourt
        courtsCollectionView.reloadData()
        nextButtonState() 
    }
    
}
