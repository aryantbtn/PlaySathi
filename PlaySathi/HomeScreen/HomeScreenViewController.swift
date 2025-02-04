//
//  HomeScreenViewController.swift
//  PlaySathi
//
//  Created by Batch - 2 on 15/01/25.
//

import UIKit

class HomeScreenViewController: UIViewController {

    var instance3 = ScreenNavigation.navigate
    
    var selectedIndexPath: IndexPath?
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        self.tabBarController?.isTabBarHidden = true
    }
    
    func registerCells() {
        let firstNib = UINib(nibName: HomeScreenCollectionViewCell.identifier, bundle: nil)
        let secondNib = UINib(nibName: PlayerCollectionViewCell.identifier, bundle: nil)
       let thirdNib = UINib(nibName: VenueCollectionViewCell.identifier, bundle: nil)
        let fourthNib = UINib(nibName: GameEntryCollectionViewCell.identifier, bundle: nil)
        let fifthNib = UINib(nibName: PlayerSelectionCollectionViewCell.identifier, bundle: nil)
        let sixthNib = UINib(nibName: GameCardCollectionViewCell.identifier, bundle: nil)
                
        
        collectionView.register(firstNib, forCellWithReuseIdentifier: HomeScreenCollectionViewCell.identifier)
        collectionView.register(secondNib, forCellWithReuseIdentifier: PlayerCollectionViewCell.identifier)
        collectionView.register(thirdNib, forCellWithReuseIdentifier: VenueCollectionViewCell.identifier)
        collectionView.register(fourthNib, forCellWithReuseIdentifier: GameEntryCollectionViewCell.identifier)
        collectionView.register(fifthNib, forCellWithReuseIdentifier: PlayerSelectionCollectionViewCell.identifier)
        collectionView.register(sixthNib, forCellWithReuseIdentifier: GameCardCollectionViewCell.identifier)
        collectionView.register(SectionHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeaderCollectionReusableView")
        
        collectionView.setCollectionViewLayout(generateLayout(), animated: true)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension HomeScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        6
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            1
        case 1:
            DataController.userData.count
        case 2:
            DataController.venueData.count
        case 3:
            1
        case 4:
            1
        case 5 :
            1
        default : 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeScreenCollectionViewCell.identifier, for: indexPath) as! HomeScreenCollectionViewCell
            cell.dispaly(with:indexPath)
            cell.layer.cornerRadius = 8
            return cell
            
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerCollectionViewCell.identifier, for: indexPath) as! PlayerCollectionViewCell
            cell.setup(with:indexPath)
            cell.layer.cornerRadius = 8
            return cell
            
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VenueCollectionViewCell.identifier, for: indexPath) as! VenueCollectionViewCell
            cell.update(with:indexPath)
            cell.layer.cornerRadius = 8
            cell.clipsToBounds = true
            return cell
            
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameEntryCollectionViewCell.identifier, for: indexPath) as! GameEntryCollectionViewCell
            cell.d(with:indexPath)
            cell.layer.cornerRadius = 8
            return cell
            
        case 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerSelectionCollectionViewCell.identifier, for: indexPath) as! PlayerSelectionCollectionViewCell
            cell.disp(with:indexPath)
            cell.layer.cornerRadius = 8
            return cell
            
        case 5:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCardCollectionViewCell.identifier, for: indexPath) as! GameCardCollectionViewCell
            cell.game(with:indexPath)
            cell.layer.cornerRadius = 8
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeScreenCollectionViewCell.identifier, for: indexPath) as! HomeScreenCollectionViewCell
            cell.dispaly(with:indexPath)
            cell.layer.cornerRadius = 8
            return cell
        }
    }
    
    func generateLayout()->UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex,enviroment)->NSCollectionLayoutSection? in let section:NSCollectionLayoutSection
            switch sectionIndex{
            case 0:
                section =  self.generateSection1Layout()
            case 1:
                section = self.generateSection2Layout()
            case 2:
                section = self.generateSection3Layout()
            case 3:
                section = self.generateSection4Layout()
            case 4:
                section = self.generateSection5Layout()
                
            case 5:
                section = self.generateSection6Layout()
            default : print("Wrong Section")
                return nil
            }
            return section
        }
        return layout
    }
    
    func generateSection1Layout()->NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(150))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        group.contentInsets = NSDirectionalEdgeInsets(top: 16, leading:8, bottom: 8, trailing: 8)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        return section
    }
    
    func generateSection2Layout()->NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.33))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7), heightDimension: .absolute(250))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 8, leading:8, bottom: 8, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader,alignment: .top)
        section.boundarySupplementaryItems = [header]
        return section
    }
    func generateSection3Layout()->NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(160), heightDimension: .absolute(194))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 8, leading:8, bottom: 8, trailing: 0)
        group.interItemSpacing = .fixed(2)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader,alignment: .top)
        section.boundarySupplementaryItems = [header]
        return section
    }
    func generateSection4Layout()->NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(130))
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
    
    func generateSection5Layout()->NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(120))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        group.contentInsets = NSDirectionalEdgeInsets(top: 8, leading:8, bottom: 8, trailing: 8)
        group.interItemSpacing = .fixed(2)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader,
                                                                 alignment: .top)
        section.boundarySupplementaryItems = [header]
        return section
    }
    func generateSection6Layout()->NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(150))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        group.contentInsets = NSDirectionalEdgeInsets(top: 8, leading:8, bottom: 8, trailing: 8)
        group.interItemSpacing = .fixed(2)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader,
                                                                 alignment: .top)
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeaderCollectionReusableView", for: indexPath) as! SectionHeaderCollectionReusableView
        headerView.headerLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        switch indexPath.section {
        case 1:
            headerView.headerLabel.text = DataController.sectionHeaderNames[1]
            headerView.button.setTitle("See All", for: .normal)
            headerView.button.addTarget(self, action: #selector(playerButtonTapped), for: .touchUpInside)
        case 2:
            headerView.headerLabel.text = DataController.sectionHeaderNames[2]
            headerView.button.setTitle("See All", for: .normal)
            headerView.button.addTarget(self, action: #selector(venueButtonTapped), for: .touchUpInside)
        case 3:
            headerView.headerLabel.text = DataController.sectionHeaderNames[3]
            headerView.button.setTitle("See All", for: .normal)
            
        case 4:
            headerView.headerLabel.text = DataController.sectionHeaderNames[4]
            headerView.button.setTitle("See All", for: .normal)
        
        case 5:
            headerView.headerLabel.text = DataController.sectionHeaderNames[5]
            headerView.button.setTitle("See All", for: .normal)
        default:
            print("fsg")
        }
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let gameEntry = DataController.sectionHeaderNames[indexPath.section]
            performSegue(withIdentifier: "GameEntry", sender: (Any).self)
        }
        else if indexPath.section == 2{
            instance3.check = "ios"
            let storyboard = UIStoryboard(name: "tabVishwajeet", bundle: nil)
            let destVC = storyboard.instantiateViewController(withIdentifier: "venueId2") as! VenueDetailViewController
            destVC.indexPathForVenueDetail = indexPath
            self.navigationController?.pushViewController(destVC, animated: true)
        }
        else if indexPath.section == 1{
            instance3.check = "players"
            let storyboard = UIStoryboard(name: "tabAryan", bundle: nil)
            let destVC = storyboard.instantiateViewController(withIdentifier: "playerId2") as! PlayerProfileTableViewController
            destVC.indexPathForPlayerProfile = indexPath
            self.navigationController?.pushViewController(destVC, animated: true)
        }
    }
@objc func venueButtonTapped() {
    instance3.check = "ios"
    let storyBoard = UIStoryboard(name: "tabVishwajeet", bundle: nil)
    if let venueVC = storyBoard.instantiateViewController(withIdentifier: "venueId") as? VenueListViewController {
        self.navigationController?.pushViewController(venueVC, animated: true)
        }
    }
    @objc func playerButtonTapped() {
        instance3.check = "players"
        let storyBoard = UIStoryboard(name: "tabAryan", bundle: nil)
        
        if let playerVC = storyBoard.instantiateViewController(withIdentifier: "playerId") as? PlayerList1ViewController {
            self.navigationController?.pushViewController(playerVC, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Good"{
            let dVC = segue.destination as! VenueDetailViewController
            dVC.indexPathForVenueDetail = selectedIndexPath!
        }
    }

    @IBAction func unwibd(segue:UIStoryboardSegue){
   
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
  
   

}
