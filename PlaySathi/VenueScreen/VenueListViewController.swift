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
    
    @IBOutlet weak var searchBar: UITextField!
   
       var distance = ["Nearby Distance", "Price", "Rating"]
       var filteredVenueData: [Venue] = []
       
       override func viewDidLoad() {
           super.viewDidLoad()
           setupUI()
           registerCells()
           self.tabBarController?.isTabBarHidden = true
           venueCollectionView.setCollectionViewLayout(generateLayout(), animated: true)
           venueCollectionView.dataSource = self
           venueCollectionView.delegate = self
        
           filteredVenueData = DataController.venueData
           
          
           sortDistance()
       }
       
    private func setupUI() {
            self.tabBarController?.isTabBarHidden = true
            venueCollectionView.setCollectionViewLayout(generateLayout(), animated: true)
            venueCollectionView.dataSource = self
            venueCollectionView.delegate = self
            
            // Setup search functionality
            searchBar.placeholder = "Type Venue Name"
            searchBar.addTarget(self, action: #selector(searchTextChanged), for: .editingChanged)
        }
    @objc private func searchTextChanged() {
            guard let searchText = searchBar.text else { return }
            
            if searchText.isEmpty {
                filteredVenueData = DataController.venueData
            } else {
                filteredVenueData = DataController.venueData.filter { venue in
                    venue.name.lowercased().contains(searchText.lowercased())
                }
            }
            
            // Apply current sorting to filtered results
            if let currentSorting = sortingTitle.text {
                sortVenuesByCriteria(currentSorting)
            }
            
            venueCollectionView.reloadData()
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
       
      
    func sortVenuesByCriteria(_ criteria: String) {
           switch criteria {
           case "Nearby Distance":
               filteredVenueData.sort { $0.distanceInKm < $1.distanceInKm }
           case "Price":
               filteredVenueData.sort { $0.price < $1.price }
           case "Rating":
               filteredVenueData.sort { $0.rating > $1.rating }
           default:
               break
           }
           
           DispatchQueue.main.async {
               self.venueCollectionView.reloadData()
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
           // Update the cell with filtered venue data
                   cell.venueListImage.image = UIImage(named: venue.imageUrl)
                   cell.venueListName.text = venue.name
                   cell.venueListDistance.text = "₹ \(venue.price.formatted())"
                   cell.layer.cornerRadius = 8
                   return cell
       }
       
       var selectedIndexPath: IndexPath?
       let searchBarcontent = UISearchBar()
       
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
