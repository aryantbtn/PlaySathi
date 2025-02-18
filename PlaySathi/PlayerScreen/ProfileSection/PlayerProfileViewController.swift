//
//  PlayerProfileTableViewController.swift
//  PlaySathi
//
//  Created by Batch - 2 on 22/01/25.
//

import UIKit

class PlayerProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var instance4 = ScreenNavigation.navigate
    @IBOutlet weak var playerInfoTableView: UITableView!
    @IBOutlet weak var playerAchievement: UICollectionView!
    
    var indexPathForPlayerProfile: IndexPath = IndexPath()
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
        playerAchievement.collectionViewLayout = generateLayout()
        
        registerCollectionView()
        playerInfoTableView.reloadData()
        playerAchievement.reloadData()
    }
    
    // Func Register CollectionView
    func registerCollectionView() {
        let collectionViewNib = UINib(nibName: "PlayerAchievementCollectionViewCell", bundle: nil)

        playerAchievement.register(collectionViewNib, forCellWithReuseIdentifier: "PlayerAchievementCollectionViewCell")
        
        
        playerAchievement.register(AcheivementSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "AcheivementSectionHeader")
        
        playerAchievement.delegate = self
        playerAchievement.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "AcheivementSectionHeader", for: indexPath) as! AcheivementSectionHeader
            
            let title = ["Achievement"]
            header.headerLabel.text = title[indexPath.section]
            
            switch indexPath.section {
            case 0:
                header.headerLabel.font = .systemFont(ofSize: 24, weight: .bold)
            default:
                break
                
            }
            return header
        }
        
        return UICollectionReusableView()
        
    }
        
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataController.achieve.count // Example count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayerAchievementCollectionViewCell", for: indexPath) as! PlayerAchievementCollectionViewCell
        cell.updateAchievementInfo(achievement: DataController.achieve[indexPath.row])
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        return cell
    }
    
    
    //MARK: - Collection View Generate Layout Function
    func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex,enviroment)->NSCollectionLayoutSection? in let section:NSCollectionLayoutSection
            section = self.generateHorizontalLayout()
            
            return section
        }
        
        return layout
    }
    

    
    
    @IBAction func inviteButtonTapped(_ sender: Any) {
        if instance4.check == "players1" {
            let targetVC = (navigationController?.viewControllers[1])!
            self.navigationController?.popToViewController(targetVC, animated: true)
                    
            if let destVC = navigationController?.viewControllers[1] as? CreateGameTableViewController {
                destVC.player = DataController.userData[indexPathForPlayerProfile.row].name
            }
                
        }
        else{
            if listOfSections.contains(.inviteSent) {
                self.navigationController?.popToRootViewController(animated: true)
            } else {
                listOfSections.insert(.inviteSent, at: 1)
                DataController.headers[.inviteSent] = "Invite Sent"
                self.navigationController?.popToRootViewController(animated: true)
                        
            }
        }
     
    }
    
    
    
   
    
    func generateHorizontalLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(150), // Fixed width for each item
            heightDimension: .absolute(180) // Fixed height for each item
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .estimated(160), // Allows items to scroll horizontally
            heightDimension: .absolute(180)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous // Enables horizontal scrolling
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        section.boundarySupplementaryItems = [header]
        
        return section
    }
}


// MARK: - Table View Extension
extension PlayerProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func registerTableView() {
        let section1Nib = UINib(nibName: "PlayerSection1TableViewCell", bundle: nil)
        playerInfoTableView.register(section1Nib, forCellReuseIdentifier: "PlayerSection1TableViewCell")
     
        let section2Nib = UINib(nibName: "PlayerSection2TableViewCell", bundle: nil)
        playerInfoTableView.register(section2Nib, forCellReuseIdentifier: "PlayerSection2TableViewCell")
        
        
        
        playerInfoTableView.delegate = self
        playerInfoTableView.dataSource = self
    }
    
     
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return 1
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerSection1TableViewCell", for: indexPath) as! PlayerSection1TableViewCell
            cell.updatePlayerInfo(with: indexPathForPlayerProfile)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerSection2TableViewCell", for: indexPath) as! PlayerSection2TableViewCell
            cell.updatePlayerMatchStats(with: indexPathForPlayerProfile)
            return cell
        }
    }
    
    
    // MARK: - Table View Delegate Methods
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44 // Adjusted header height for visibility
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 200 // Height for Section 0
        } else {
            return 140 // Height for Section 1
        }
    }

}
