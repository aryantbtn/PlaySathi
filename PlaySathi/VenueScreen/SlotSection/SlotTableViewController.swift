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
    
   
      private var headerView: UIView?
     
      private var availableCourts: [String] = []
      
      override func viewDidLoad() {
          super.viewDidLoad()
          setupSlotCollectionView()
          setupCollectionView()
          setupLegendHeaderView()
          datePicker.minimumDate = Date()
          dispaly()
          nextButton.isEnabled = false
         
          nextButtonState()
          courtsCollectionView.isHidden = true
      }
    
  
    private func setupLegendHeaderView() {
           let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 40))
           headerView.backgroundColor = .systemBackground
           
           let availableBox = createColorBox(color: UIColor.systemGreen)
           let availableLabel = createLabel(text: "Available")
           let bookedBox = createColorBox(color: UIColor.systemGray4)
           let bookedLabel = createLabel(text: "Booked")
           
           headerView.addSubview(availableBox)
           headerView.addSubview(availableLabel)
           headerView.addSubview(bookedBox)
           headerView.addSubview(bookedLabel)
           
           NSLayoutConstraint.activate([
               availableBox.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
               availableBox.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
               availableLabel.leadingAnchor.constraint(equalTo: availableBox.trailingAnchor, constant: 8),
               availableLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
               
               bookedBox.leadingAnchor.constraint(equalTo: availableLabel.trailingAnchor, constant: 32),
               bookedBox.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
               bookedLabel.leadingAnchor.constraint(equalTo: bookedBox.trailingAnchor, constant: 8),
               bookedLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
           ])
           
           self.headerView = headerView
           headerView.isHidden = true
           tableView.tableHeaderView = headerView
       }
       
       private func createColorBox(color: UIColor) -> UIView {
           let box = UIView()
           box.translatesAutoresizingMaskIntoConstraints = false
           box.backgroundColor = color
           box.layer.cornerRadius = 4
           
           NSLayoutConstraint.activate([
               box.widthAnchor.constraint(equalToConstant: 16),
               box.heightAnchor.constraint(equalToConstant: 16)
           ])
           
           return box
       }
       
       private func createLabel(text: String) -> UILabel {
           let label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           label.text = text
           label.font = .systemFont(ofSize: 12)
           label.textColor = .label
           return label
       }
       

    
            

  
    
    func nextButtonState() {
      
                nextButton.isEnabled = selectedTimeSlot != -1 && selectedCourt != -1
        nextButton.tintColor = nextButton.isEnabled ? .accent : .systemGray

        
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



extension SlotTableViewController: TimeSlotTableViewCellDelegate {
    func timeSlotSelected(selectedTimeSlot: Int) {
        self.selectedTimeSlot = selectedTimeSlot
        if selectedTimeSlot != -1 {
            courtsCollectionView.isHidden = false
            headerView?.isHidden = false
            availableCourts = DataController.venueData[indexPathForSlotSection!.row].numberOfCourts
        } else {
            courtsCollectionView.isHidden = true
            headerView?.isHidden = true
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
