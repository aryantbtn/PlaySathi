//
//  VenueListViewController.swift
//  PlaySathi
//
//  Created by Batch - 2 on 16/01/25.
//

import UIKit

class VenueListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var venueCollectionView: UICollectionView!
    @IBOutlet var sortingButton: UIButton!
    @IBOutlet var sortingTitle: UILabel!
    
    // Added sorting criteria
       var distance = ["Nearby Distance", "Price", "Rating"]
       var filteredVenueData: [Venue] = []
       
       override func viewDidLoad() {
           super.viewDidLoad()
           registerCells()
           self.tabBarController?.isTabBarHidden = true
           venueCollectionView.setCollectionViewLayout(generateLayout(), animated: true)
           venueCollectionView.dataSource = self
           venueCollectionView.delegate = self
           
           // Initially set venue data to all venues
           filteredVenueData = DataController.venueData
           
           // Initialize sorting menu and apply filtering
           sortDistance()
       }
       
       // Sort and filter venues based on selection
       private func sortDistance() {
           var sortingAction: [UIAction] = []
           
           for status in distance {
               let action = UIAction(title: status, handler: { [weak self] _ in
                   self?.sortingTitle.text = status
                   self?.sortVenuesByCriteria(status) // Call filter function
                   self?.venueCollectionView.reloadData() // Reload collection view after sorting
               })
               sortingAction.append(action)
           }
           
           let statusMenu = UIMenu(title: "Sort By", options: [], children: sortingAction)
           sortingButton.menu = statusMenu
           sortingButton.showsMenuAsPrimaryAction = true
       }
       
       // Filter venues based on sorting criteria
    func sortVenuesByCriteria(_ criteria: String) {
        switch criteria {
        case "Nearby Distance":
            DataController.venueData.sort(by: { $0.distanceInKm < $1.distanceInKm })
        case "Price":
            DataController.venueData.sort(by: { $0.price < $1.price })
        case "Rating":
            DataController.venueData.sort(by: { $0.rating > $1.rating })
        default:
            break
        }
    }
       
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return filteredVenueData.count
       }
       
       func numberOfSections(in collectionView: UICollectionView) -> Int {
           return 1
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VenueListCollectionViewCell.identifier, for: indexPath) as! VenueListCollectionViewCell
           let venue = filteredVenueData[indexPath.item]
           cell.updateFunc(with: indexPath)  // Update cell with the sorted venue
           cell.layer.cornerRadius = 8
           return cell
       }
       
       var selectedIndexPath: IndexPath?
       let searchBar = UISearchBar()
       
       func registerCells() {
           let firstNib = UINib(nibName: VenueListCollectionViewCell.identifier, bundle: nil)
           venueCollectionView.register(firstNib, forCellWithReuseIdentifier: VenueListCollectionViewCell.identifier)
       }
       
       func generateLayout() -> UICollectionViewLayout {
           let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
               let section = self.generateSectionLayout()
               let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
               let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
               section.boundarySupplementaryItems = [header]
               return section
           }
           return layout
       }
       
       func generateSectionLayout() -> NSCollectionLayoutSection {
           let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
           let item = NSCollectionLayoutItem(layoutSize: itemSize)
           let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(235))
           let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
           group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8)
           group.interItemSpacing = .fixed(8)
           let section = NSCollectionLayoutSection(group: group)
           return section
       }
       
       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           let entry = filteredVenueData[indexPath.item]
           selectedIndexPath = indexPath
           performSegue(withIdentifier: "Good", sender: entry)
       }
       
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "Good" {
               let dVC = segue.destination as! VenueDetailViewController
               dVC.indexPathForVenueDetail = selectedIndexPath!
           }
       }
   }
