//
//  VenueListViewController.swift
//  PlaySathi
//
//  Created by Batch - 2 on 16/01/25.
//

import UIKit

class VenueListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var venueCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        self.tabBarController?.isTabBarHidden = true
        venueCollectionView.setCollectionViewLayout(generateLayout(), animated: true)
        venueCollectionView.dataSource = self
        venueCollectionView.delegate = self
        
        // Initialize filteredVenues with all venues
        filteredVenues = venues
        setupUI()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ScreenData.venueData.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VenueListCollectionViewCell.identifier, for: indexPath) as! VenueListCollectionViewCell
        cell.updateFunc(with:indexPath)
        cell.layer.cornerRadius = 8
        return cell
    }
    
    var venues: [String] = ["Say No To Stress", "Say Sports Academy", "CrowdFit Academy", "Piyush Verma", "Mathura Academy", "Gurugram Academy"]
    var filteredVenues: [String] = []
    var selectedIndexPath: IndexPath?
    let searchBar = UISearchBar()
    
    func registerCells() {
        let firstNib = UINib(nibName: VenueListCollectionViewCell.identifier, bundle: nil)
        venueCollectionView.register(firstNib, forCellWithReuseIdentifier: VenueListCollectionViewCell.identifier)
    }
    func generateLayout()->UICollectionViewLayout{
        
        let layout = UICollectionViewCompositionalLayout {
            
            (sectionIndex,enviroment)->NSCollectionLayoutSection? in let section:NSCollectionLayoutSection
            section =  self.generateSectionLayout()
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader,alignment: .top)
            section.boundarySupplementaryItems = [header]
            return section
        }
        return layout
    }
    func generateSectionLayout()->NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(224))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count : 2)
        group.contentInsets = NSDirectionalEdgeInsets(top: 8, leading:8, bottom: 8, trailing: 8)
        group.interItemSpacing = .fixed(8)
        let section = NSCollectionLayoutSection(group: group)
        //        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    // mrak ---------
    
    func setupUI() {
        // Set the title
        self.title = "Venue"
        
        // Create a container for search and filter
        let searchContainer = UIView()
        searchContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchContainer)
        
        // Set up search bar
        searchBar.placeholder = "Search venues"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchContainer.addSubview(searchBar)
        
        // Set up filter button
        let filterButton = UIButton(type: .system)
        filterButton.setTitle("Filters", for: .normal)
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        filterButton.addTarget(self, action: #selector(openFilters), for: .touchUpInside)
        searchContainer.addSubview(filterButton)
        
        // Add constraints for search bar and filter button
        NSLayoutConstraint.activate([
            searchContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            searchBar.leadingAnchor.constraint(equalTo: searchContainer.leadingAnchor),
            searchBar.topAnchor.constraint(equalTo: searchContainer.topAnchor),
            searchBar.bottomAnchor.constraint(equalTo: searchContainer.bottomAnchor),
            searchBar.trailingAnchor.constraint(equalTo: filterButton.leadingAnchor, constant: -10),
            
            filterButton.topAnchor.constraint(equalTo: searchContainer.topAnchor),
            filterButton.bottomAnchor.constraint(equalTo: searchContainer.bottomAnchor),
            filterButton.trailingAnchor.constraint(equalTo: searchContainer.trailingAnchor)
        ])
    }
    
    // Filter button action
    @objc func openFilters() {
        let alert = UIAlertController(title: "Filter Venues", message: nil, preferredStyle: .actionSheet)
        
        // Filter options
        let nearbyAction = UIAlertAction(title: "Nearby", style: .default) { _ in
            // Add your nearby filter logic here
            self.filterVenuesByNearby()
        }
        let priceAction = UIAlertAction(title: "Price", style: .default) { _ in
            // Add your price filter logic here
            self.filterVenuesByPrice()
        }
        let favoritesAction = UIAlertAction(title: "Favorites", style: .default) { _ in
            // Add your favorites filter logic here
            self.filterVenuesByFavorites()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        // Add actions to alert controller
        alert.addAction(nearbyAction)
        alert.addAction(priceAction)
        alert.addAction(favoritesAction)
        alert.addAction(cancelAction)
        
        // Present the alert
        present(alert, animated: true, completion: nil)
    }
    
    // UISearchBarDelegate method for search functionality
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredVenues = venues
        } else {
            filteredVenues = venues.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
        // Reload your table/collection view with filteredVenues
        print(filteredVenues) // For testing
    }
    
    // Filter functions
    func filterVenuesByNearby() {
        // Add logic to filter by nearby
        print("Filtering by Nearby")
    }
    
    func filterVenuesByPrice() {
        // Add logic to filter by price
        print("Filtering by Price")
    }
    
    func filterVenuesByFavorites() {
        // Add logic to filter by favorites
        print("Filtering by Favorites")
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let entry = ScreenData.venueData[indexPath.section]
        selectedIndexPath = indexPath
        newCreatedGame.venue = entry
        performSegue(withIdentifier: "Good", sender: entry)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Good"{
            let dVC = segue.destination as! VenueDetailViewController
            dVC.indexPathForVenueDetail = selectedIndexPath!
        }
    }
}
