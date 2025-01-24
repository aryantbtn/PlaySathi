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
    
    var distance = ["Nearby Distance", "Price", "Rating"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        self.tabBarController?.isTabBarHidden = true
        venueCollectionView.setCollectionViewLayout(generateLayout(), animated: true)
        venueCollectionView.dataSource = self
        venueCollectionView.delegate = self
        sortDistance()
    }
    
    private func sortDistance() {
        var sortingAction: [UIAction] = []
        for status in distance {
            let action = UIAction(title: status, handler: { [weak self] _ in
                self?.sortingTitle.text = status
                self?.venueCollectionView.reloadData()
            })
            sortingAction.append(action)
        }
        let statusMenu = UIMenu(title: "Sorting", options: [], children: sortingAction)
        sortingButton.menu = statusMenu
        sortingButton.showsMenuAsPrimaryAction = true
        
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
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading:8, bottom: 8, trailing: 8)
        group.interItemSpacing = .fixed(8)
        let section = NSCollectionLayoutSection(group: group)
        //        section.orthogonalScrollingBehavior = .groupPaging
        return section
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
