//
//  PlayerRequestViewController.swift
//  PlaySathi
//
//  Created by Mac on 09/02/25.
//

import UIKit

class PlayerRequestViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var cv: UICollectionView!
    var t : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        self.tabBarController?.isTabBarHidden = true
        cv.setCollectionViewLayout(generateLayout(), animated: true)
        cv.dataSource = self
        cv.delegate = self
        navigationItem.title = t
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerSelectionCollectionViewCell.identifier, for: indexPath) as! PlayerSelectionCollectionViewCell
        cell.disp(with:indexPath)
        cell.layer.cornerRadius = 8
        return cell
    }
    
    func registerCells() {
        let firstNib = UINib(nibName: PlayerSelectionCollectionViewCell.identifier, bundle: nil)
        cv.register(firstNib, forCellWithReuseIdentifier: PlayerSelectionCollectionViewCell.identifier)
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
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(120))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading:8, bottom: 8, trailing: 8)
        group.interItemSpacing = .fixed(2)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
    
}
