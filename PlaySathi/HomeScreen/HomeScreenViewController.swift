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
    var vName: IndexPath?
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
        let seventhNib = UINib(nibName: MatchesCollectionViewCell.identifier, bundle: nil)
                
        
        collectionView.register(firstNib, forCellWithReuseIdentifier: HomeScreenCollectionViewCell.identifier)
        collectionView.register(secondNib, forCellWithReuseIdentifier: PlayerCollectionViewCell.identifier)
        collectionView.register(thirdNib, forCellWithReuseIdentifier: VenueCollectionViewCell.identifier)
        collectionView.register(fourthNib, forCellWithReuseIdentifier: GameEntryCollectionViewCell.identifier)
        collectionView.register(fifthNib, forCellWithReuseIdentifier: PlayerSelectionCollectionViewCell.identifier)
        collectionView.register(sixthNib, forCellWithReuseIdentifier: GameCardCollectionViewCell.identifier)
        collectionView.register(seventhNib, forCellWithReuseIdentifier: MatchesCollectionViewCell.identifier)
        collectionView.register(SectionHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeaderCollectionReusableView")
        
        collectionView.setCollectionViewLayout(generateLayout(), animated: true)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
    @IBAction func notificationButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "tabPrince", bundle: nil)
        let notificationVC = storyboard.instantiateViewController(withIdentifier: "notification") as! NotificationTableViewController
        self.navigationController?.pushViewController(notificationVC, animated: true)
    }
    
    @IBAction func profileButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "tabPrince", bundle: nil)
        let userProfileVC = storyboard.instantiateViewController(withIdentifier: "User Profile") as! UserProfileTableViewController
        self.present(userProfileVC, animated: true)
    }
    
}

extension HomeScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        listOfSections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch listOfSections[section] {
        
        case .player:
            DataController.userData.count
        case .venue:
            DataController.venueData.count
        case .createGame:
            1
        case .venueBooked:
            1
        case .inviteSent:
            1
        case .gameCreated:
            1
        case .matches:
            1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch listOfSections[indexPath.section]{
            
        case .player:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerCollectionViewCell.identifier, for: indexPath) as! PlayerCollectionViewCell
                        cell.setup(with:indexPath)
                        cell.layer.cornerRadius = 8
                        return cell
        case .venue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VenueCollectionViewCell.identifier, for: indexPath) as! VenueCollectionViewCell
                        cell.update(with:indexPath)
                        cell.layer.cornerRadius = 8
                        cell.clipsToBounds = true
                        return cell
        case .createGame:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeScreenCollectionViewCell.identifier, for: indexPath) as! HomeScreenCollectionViewCell
                       cell.dispaly(with:indexPath)
                       cell.layer.cornerRadius = 8
                       return cell
       
        case .venueBooked:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameEntryCollectionViewCell.identifier, for: indexPath) as! GameEntryCollectionViewCell
            cell.d(with:vName!)
                            cell.layer.cornerRadius = 8
                            return cell
        case .inviteSent:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerSelectionCollectionViewCell.identifier, for: indexPath) as! PlayerSelectionCollectionViewCell
                            cell.disp(with:indexPath)
                            cell.layer.cornerRadius = 8
                            return cell
        case .gameCreated:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCardCollectionViewCell.identifier, for: indexPath) as! GameCardCollectionViewCell
                            cell.game(with:indexPath)
                            cell.layer.cornerRadius = 8
                            return cell
        case .matches:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MatchesCollectionViewCell.identifier, for: indexPath) as! MatchesCollectionViewCell
                       cell.dispaly3(with: indexPath)
                       cell.layer.cornerRadius = 8
                       return cell
        }

        

    }
    
    func generateLayout()->UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex,enviroment)->NSCollectionLayoutSection? in let section:NSCollectionLayoutSection
            switch listOfSections[sectionIndex]{
                
            case .player:
                section = self.generateSection2Layout()
            case .venue:
                section = self.generateSection3Layout()
            case .createGame:
                section = self.generateSection1Layout()
            case .venueBooked:
                section = self.generateSection4Layout()
            case .inviteSent:
                section = self.generateSection5Layout()
            case .gameCreated:
                section = self.generateSection6Layout()
            case .matches:
                section = self.generateSection7Layout()
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
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(120))
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
    func generateSection7Layout()->NSCollectionLayoutSection{
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
        
        switch listOfSections[indexPath.section] {
            
        case .player:
            headerView.headerLabel.text = DataController.headers[.player]
                        headerView.button.setTitle("See All", for: .normal)
                        headerView.button.addTarget(self, action: #selector(playerButtonTapped), for: .touchUpInside)
        case .venue:
            headerView.headerLabel.text = DataController.headers[.venue]
                        headerView.button.setTitle("See All", for: .normal)
                        headerView.button.addTarget(self, action: #selector(venueButtonTapped), for: .touchUpInside)
        case .createGame:
            headerView.headerLabel.text = DataController.headers[.createGame]
        case .venueBooked:
            headerView.headerLabel.text = DataController.headers[.venueBooked]
                      headerView.button.setTitle("See All", for: .normal)
            headerView.button.addTarget(self, action: #selector(venueSelectionCardSeeAllButtonTapped), for: .touchUpInside)
        case .inviteSent:
            headerView.headerLabel.text = DataController.headers[.inviteSent]
                        headerView.button.setTitle("See All", for: .normal)
                        headerView.button.addTarget(self, action: #selector(requestSeeAllButtonTapped), for: .touchUpInside)
        case .gameCreated:
            headerView.headerLabel.text = DataController.headers[.gameCreated]
                        headerView.button.setTitle("See All", for: .normal)
            headerView.button.addTarget(self, action: #selector(createdGameseeAllButtonTapped), for: .touchUpInside)
            
                      
        case .matches:
            headerView.headerLabel.text = DataController.headers[.matches]
                        headerView.button.setTitle("See All", for: .normal)
        }

        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch listOfSections[indexPath.section] {
            
        case .player:
            instance3.check = "players"
                        let storyboard = UIStoryboard(name: "tabAryan", bundle: nil)
            let destVC = storyboard.instantiateViewController(withIdentifier: "playerId2") as! PlayerProfileViewController
                       destVC.indexPathForPlayerProfile = indexPath
                       self.navigationController?.pushViewController(destVC, animated: true)
        case .venue:
            instance3.check = "ios"
                        let storyboard = UIStoryboard(name: "tabVishwajeet", bundle: nil)
                        let destVC = storyboard.instantiateViewController(withIdentifier: "venueId2") as! VenueDetailViewController
                        destVC.indexPathForVenueDetail = indexPath
                        self.navigationController?.pushViewController(destVC, animated: true)
        case .createGame:
            let gameEntry = DataController.headers
                      performSegue(withIdentifier: "GameEntry", sender: (Any).self)
        case .venueBooked:
            let gameEntry = DataController.headers
                      performSegue(withIdentifier: "GameEntry", sender: (Any).self)
        case .inviteSent:
            let gameEntry = DataController.headers
                      performSegue(withIdentifier: "GameEntry", sender: (Any).self)
        case .gameCreated:
            let gameEntry = DataController.headers
                      performSegue(withIdentifier: "GameEntry", sender: (Any).self)
        case .matches:
            let gameEntry = DataController.headers
                      performSegue(withIdentifier: "GameEntry", sender: (Any).self)
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
    @objc func requestSeeAllButtonTapped() {
//        let storyBoard = UIStoryboard(name: "tabPrince", bundle: nil)
//        if let vc = storyBoard.instantiateViewController(withIdentifier: "requestId") as? PlayerRequestViewController {
//            self.navigationController?.pushViewController(vc, animated: true)
//            }
        
        let storyboard = UIStoryboard(name: "tabPrince", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "score") as? ScoreboardViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
        }
    
    
    @objc func venueSelectionCardSeeAllButtonTapped() {
        let storyBoard = UIStoryboard(name: "tabPrince", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "vscard") as? VenueSelectionCardViewController {
            self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    
    @objc func createdGameseeAllButtonTapped() {
        let storyBoard = UIStoryboard(name: "tabPrince", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "createdGame") as? CreatedGameViewController {
            self.navigationController?.pushViewController(vc, animated: true)
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
