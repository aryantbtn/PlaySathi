//
//  CreatedGameViewController 2.swift
//  PlaySathi
//
//  Created by ARYAN SINGHAL on 02/03/25.
//


import UIKit

class CreatedGameViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var collectionViewForCreatedGame: UICollectionView!
    var titl : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        self.tabBarController?.isTabBarHidden = true
        collectionViewForCreatedGame.setCollectionViewLayout(generateLayout(), animated: true)
        collectionViewForCreatedGame.dataSource = self
        collectionViewForCreatedGame.delegate = self
        navigationItem.title = titl
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
     
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCardCollectionViewCell.identifier, for: indexPath) as! GameCardCollectionViewCell
        cell.updateCreateGame(with:indexPath)
        cell.layer.cornerRadius = 8
        return cell
    }
    
    func registerCells() {
        let firstNib = UINib(nibName: GameCardCollectionViewCell.identifier, bundle: nil)
        collectionViewForCreatedGame.register(firstNib, forCellWithReuseIdentifier: GameCardCollectionViewCell.identifier)
    }
    
    func generateLayout()->UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex,enviroment)->NSCollectionLayoutSection? in let section:NSCollectionLayoutSection
            section =  self.generateSectionLayout()
            return section
        }
        return layout
    }
    
    func generateSectionLayout()->NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(150))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        group.contentInsets = NSDirectionalEdgeInsets(top: 8, leading:8, bottom: 8, trailing: 8)
        group.interItemSpacing = .fixed(2)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [header]
        return section
    }
    
}
