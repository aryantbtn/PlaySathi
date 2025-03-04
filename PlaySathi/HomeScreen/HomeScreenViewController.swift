//
//  HomeScreenViewController.swift
//  PlaySathi
//
//  Created by Batch - 2 on 15/01/25.
//

import UIKit
import SwiftUI

class HomeScreenViewController: UIViewController {

    var instance3 = ScreenNavigation.navigate
    var selectedIndexPath: IndexPath?
    var vName: IndexPath?
    var pName: IndexPath?
    var venueNameForGameCard: String?
    var dateForGameCard: String?
    var timeForGameCard: String?
    var playerforGameCard: String?
    var venueTimeForGameEntry: String?
    var venueDateForGameEntry: String?
    
    
    var playersFromSupabase : [Profile]?
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(
                self,
                selector: #selector(showScoreboard),
                name: NSNotification.Name("ShowScoreboard"),
                object: nil
            )
        super.viewDidLoad()
        Task {
            print("inside task")
            await PlayerDataController.shared.getUsers(completion: { pros in
                self.playersFromSupabase = pros
                PlayerDataController.shared.userProfiles = pros
             //   self.printAllPlayers()

                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            })
           
        }
        
        registerCells()
        self.tabBarController?.isTabBarHidden = true
    }
    @objc private func showScoreboard() {
        let storyboard = UIStoryboard(name: "tabPrince", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "Score") as? ScoreboardViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    // Add this to deinit
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

//    func printAllPlayers(){
//        print("inside printAllPlayers")
//        guard let playersFromSupabase = playersFromSupabase else {
//            print("No players fetched")
//            return
//        }
//        for player in playersFromSupabase {
//            print("\(player.email) - \(player.name) - \(player.contactNumber)")
//        }
//    }
    
    func registerCells() {
        let firstNib = UINib(nibName: HomeScreenCollectionViewCell.identifier, bundle: nil)
        let secondNib = UINib(nibName: PlayerCollectionViewCell.identifier, bundle: nil)
        let thirdNib = UINib(nibName: VenueCollectionViewCell.identifier, bundle: nil)
        let fourthNib = UINib(nibName: GameEntryCollectionViewCell.identifier, bundle: nil)
        let fifthNib = UINib(nibName: PlayerSelectionCollectionViewCell.identifier, bundle: nil)
        let sixthNib = UINib(nibName: GameCardCollectionViewCell.identifier, bundle: nil)
        let seventhNib = UINib(nibName: MatchesCollectionViewCell.identifier, bundle: nil)
        let eightNib = UINib(nibName: LiveCollectionViewCell.identifier, bundle: nil)
                
        
        collectionView.register(firstNib, forCellWithReuseIdentifier: HomeScreenCollectionViewCell.identifier)
        collectionView.register(secondNib, forCellWithReuseIdentifier: PlayerCollectionViewCell.identifier)
        collectionView.register(thirdNib, forCellWithReuseIdentifier: VenueCollectionViewCell.identifier)
        collectionView.register(fourthNib, forCellWithReuseIdentifier: GameEntryCollectionViewCell.identifier)
        collectionView.register(fifthNib, forCellWithReuseIdentifier: PlayerSelectionCollectionViewCell.identifier)
        collectionView.register(sixthNib, forCellWithReuseIdentifier: GameCardCollectionViewCell.identifier)
        collectionView.register(seventhNib, forCellWithReuseIdentifier: MatchesCollectionViewCell.identifier)
        collectionView.register(eightNib, forCellWithReuseIdentifier: LiveCollectionViewCell.identifier)
        collectionView.register(SectionHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeaderCollectionReusableView")
        
        collectionView.setCollectionViewLayout(generateLayout(), animated: true)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
    @IBAction func notificationButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "tabPrince", bundle: nil)
        let notificationVC = storyboard.instantiateViewController(withIdentifier: "noti") as! NotificationViewController
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
         playersFromSupabase?.count ?? 0
            
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
        case .live:
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
                       cell.createGameCard(with:indexPath)
                       cell.layer.cornerRadius = 8
                       return cell
       
        case .venueBooked:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameEntryCollectionViewCell.identifier, for: indexPath) as! GameEntryCollectionViewCell
            cell.updateCourtBooked(with:vName!)
            cell.dateAndTime.text = venueDateForGameEntry! + " " + venueTimeForGameEntry!
            
                            cell.layer.cornerRadius = 8
                            return cell
        case .inviteSent:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerSelectionCollectionViewCell.identifier, for: indexPath) as! PlayerSelectionCollectionViewCell
                            cell.updateInviteSent(with:pName!)
                            cell.layer.cornerRadius = 8
                            return cell
        case .gameCreated:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCardCollectionViewCell.identifier, for: indexPath) as! GameCardCollectionViewCell
                            cell.updateCreateGame(with:indexPath)
            cell.venueName.text = venueNameForGameCard
            cell.dateAndTime.text = dateForGameCard! + " " + timeForGameCard!
            cell.playerSelected.image = UIImage(named: playerforGameCard!)
                            cell.layer.cornerRadius = 8
                            return cell
        case .matches:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MatchesCollectionViewCell.identifier, for: indexPath) as! MatchesCollectionViewCell
                       cell.dispaly3(with: indexPath)
                       cell.layer.cornerRadius = 8
                       return cell
        case .live:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LiveCollectionViewCell.identifier, for: indexPath) as! LiveCollectionViewCell
                       cell.di(with: indexPath)
                       cell.layer.cornerRadius = 8
                       return cell
        }
    }
    
    func generateLayout()->UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex,enviroment)->NSCollectionLayoutSection? in let section:NSCollectionLayoutSection
            switch listOfSections[sectionIndex] {
                
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
            case .live:
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
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(160), heightDimension: .absolute(215))
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
    
    func generateSection4Layout()->NSCollectionLayoutSection {
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
    
    func generateSection5Layout() -> NSCollectionLayoutSection {
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
    
    func generateSection6Layout() -> NSCollectionLayoutSection {
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
    
    func generateSection7Layout() -> NSCollectionLayoutSection {
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeaderCollectionReusableView", for: indexPath) as! SectionHeaderCollectionReusableView
            headerView.headerLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            
            switch listOfSections[indexPath.section] {
                
            case .player:
                headerView.headerLabel.text = DataController.headers[.player]
                headerView.button.setTitle("See All", for: .normal)
                headerView.button.tag = indexPath.section  // Add tag to identify section
                            headerView.button.addTarget(self, action: #selector(sectionHeaderButtonTapped(_:)), for: .touchUpInside)

            case .venue:
                headerView.headerLabel.text = DataController.headers[.venue]
                headerView.button.setTitle("See All", for: .normal)
                headerView.button.tag = indexPath.section  // Add tag to identify section
                            headerView.button.addTarget(self, action: #selector(sectionHeaderButtonTapped(_:)), for: .touchUpInside)

            case .createGame:
                headerView.headerLabel.text = DataController.headers[.createGame]
            case .venueBooked:
                headerView.headerLabel.text = DataController.headers[.venueBooked]
                headerView.button.setTitle("See All", for: .normal)
                headerView.button.tag = indexPath.section  // Add tag to identify section
                            headerView.button.addTarget(self, action: #selector(sectionHeaderButtonTapped(_:)), for: .touchUpInside)

            case .inviteSent:
                headerView.headerLabel.text = DataController.headers[.inviteSent]
                headerView.button.setTitle("See All", for: .normal)
                headerView.button.tag = indexPath.section  // Add tag to identify section
                            headerView.button.addTarget(self, action: #selector(sectionHeaderButtonTapped(_:)), for: .touchUpInside)

            case .gameCreated:
                headerView.headerLabel.text = DataController.headers[.gameCreated]
                headerView.button.setTitle("See All", for: .normal)
                headerView.button.tag = indexPath.section  // Add tag to identify section
                            headerView.button.addTarget(self, action: #selector(sectionHeaderButtonTapped(_:)), for: .touchUpInside)
                
            case .matches:
                headerView.headerLabel.text = DataController.headers[.matches]
                headerView.button.setTitle("See All", for: .normal)
            case .live:
                headerView.headerLabel.text = DataController.headers[.live]
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
            let hostingController = UIHostingController(rootView:
                    VenueCardView(
                        isPresented: .constant(true),
                        venueName: DataController.venueData[vName!.row].name,
                        courtNumber: "3",
                        timeSlot:venueTimeForGameEntry!,
                        date: venueDateForGameEntry!,
                        distance: "2.5 km",
                        price: "\(DataController.venueData[vName!.row].price)",
                        dismissAction: { [weak self] in
                            self?.dismiss(animated: true)
                        }
                    )
                )
                hostingController.modalPresentationStyle = .overCurrentContext
                hostingController.view.backgroundColor = .clear
                hostingController.modalTransitionStyle = .crossDissolve
                present(hostingController, animated: true)

        case .inviteSent:
            let hostingController = UIHostingController(rootView: 
                InviteCardView(
                    isPresented: .constant(true),
                    playerName: "Akash",
                    elitePoints: 23,
                    date: "25 Feb 2025",
                    time: "6:00 PM",
                    status: "pending",
                    dismissAction: { [weak self] in
                        self?.dismiss(animated: true)
                    }
                )
            )
            hostingController.modalPresentationStyle = .overCurrentContext
            hostingController.view.backgroundColor = .clear
            hostingController.modalTransitionStyle = .crossDissolve
            present(hostingController, animated: true)
        case .gameCreated:
            let hostingController = UIHostingController(rootView:
                   CreateGameCardView(
                       isPresented: .constant(true),
                       playerName: "John Doe",
                       playerImage: "player_profile", // Make sure this image exists in assets
                       elitePoints: 100,
                       venueName: "Sports Complex",
                       courtNumber: "3",
                       timeSlot: "2:00 PM - 3:00 PM",
                       date: "25 Feb 2025",
                       price: "₹500",
                       status: "Pending", // Add status parameter
                       dismissAction: { [weak self] in
                           self?.dismiss(animated: true)
                       }
                   )
               )
               hostingController.modalPresentationStyle = .overCurrentContext
               hostingController.view.backgroundColor = .clear
               hostingController.modalTransitionStyle = .crossDissolve
               present(hostingController, animated: true)
            
        case .matches:
            let gameEntry = DataController.headers
        case .live:
            let gameentry = DataController.headers
        }
    }
    
    @objc private func sectionHeaderButtonTapped(_ sender: UIButton) {
            let section = sender.tag
            let sectionType = listOfSections[section]
        let headerTitle = DataController.headers[sectionType] ?? ""
            
            switch sectionType {
            case .player:
                instance3.check = "players"
                let storyBoard = UIStoryboard(name: "tabAryan", bundle: nil)
                if let playerVC = storyBoard.instantiateViewController(withIdentifier: "playerId") as? PlayerList1ViewController {
                    navigationController?.pushViewController(playerVC, animated: true)
                }
                
            case .venue:
                instance3.check = "ios"
                let storyBoard = UIStoryboard(name: "tabVishwajeet", bundle: nil)
                if let venueVC = storyBoard.instantiateViewController(withIdentifier: "venueId") as? VenueListViewController {
                    navigationController?.pushViewController(venueVC, animated: true)
                }
                
            case .venueBooked:
                let storyBoard = UIStoryboard(name: "tabPrince", bundle: nil)
                if let vc = storyBoard.instantiateViewController(withIdentifier: "vscard") as? VenueSelectionCardViewController {
                    vc.courtBookedTitle = headerTitle
                    vc.indexPathForVenue = vName
                    navigationController?.pushViewController(vc, animated: true)
                }
                
            case .inviteSent:
                let storyBoard = UIStoryboard(name: "tabPrince", bundle: nil)
                if let vc = storyBoard.instantiateViewController(withIdentifier: "requestId") as? PlayerRequestViewController {
                    vc.inviteSentTitle = headerTitle
                    vc.indexPathForPlayers = pName
                    navigationController?.pushViewController(vc, animated: true)
                }
                
            case .gameCreated:
                let storyBoard = UIStoryboard(name: "tabPrince", bundle: nil)
                if let vc = storyBoard.instantiateViewController(withIdentifier: "createdGame") as? CreatedGameViewController {
                    vc.title = headerTitle
                    navigationController?.pushViewController(vc, animated: true)
                }
                
            default:
                break
                
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
//        if let matchesIndex = listOfSections.firstIndex(of: .matches) {
//                        listOfSections.remove(at: matchesIndex)
//                collectionView.reloadData()
//                    }
    }

    
}
