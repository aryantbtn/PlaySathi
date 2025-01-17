//
//  VenueListViewController.swift
//  PlaySathi
//
//  Created by Batch - 2 on 16/01/25.
//

import UIKit

class VenueListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
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

    @IBOutlet var venueCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        venueCollectionView.setCollectionViewLayout(generateLayout(), animated: true)
        venueCollectionView.dataSource = self
        venueCollectionView.delegate = self
        
    }
    
    func registerCells() {
        let firstNib = UINib(nibName: VenueListCollectionViewCell.identifier, bundle: nil)
        venueCollectionView.register(firstNib, forCellWithReuseIdentifier: VenueListCollectionViewCell.identifier)
    }
    
    func generateLayout()->UICollectionViewLayout{
        
        let layout = UICollectionViewCompositionalLayout {
            
            (sectionIndex,enviroment)->NSCollectionLayoutSection? in let section:NSCollectionLayoutSection
           
                section =  self.generateSectionLayout()
            
            
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader,
                                                                         alignment: .top)
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
    
   
}


