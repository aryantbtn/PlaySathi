//
//  VenueDetailViewController.swift
//  PlaySathi
//
//  Created by Batch - 2 on 20/01/25.
//

import UIKit

class VenueDetailViewController: UIViewController ,UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var proceedButton: UIButton!
    @IBOutlet weak var price: UILabel!
    var indexPathForVenueDetail : IndexPath = IndexPath()
    
    @IBOutlet var venueCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        price.text = "₹\(DataController.venueData[indexPathForVenueDetail.row].price)/hour"
        proceedButton.layer.cornerRadius = 10
        registerCells()
        
        venueCollectionView.register(HeaderForVenueCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderForVenueCollectionReusableView")
       venueCollectionView.setCollectionViewLayout(generateLayout(), animated: true)
        venueCollectionView.dataSource = self
        venueCollectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            1
        case 1:
            1
        case 2:
            DataController.venueData[indexPathForVenueDetail.row].amenities.count
        default : 0
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
            case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VenueDetailCollectionViewCell", for: indexPath) as! VenueDetailCollectionViewCell
            cell.display(with : indexPathForVenueDetail)
              cell.layer.cornerRadius = 8
              return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VenueDescriptionCollectionViewCell", for: indexPath) as! VenueDescriptionCollectionViewCell
            cell.show(with : indexPath)
              cell.layer.cornerRadius = 8
              return cell
        case 2 :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VenueAmenitiesCollectionViewCell", for: indexPath) as! VenueAmenitiesCollectionViewCell
            cell.assignData(with : indexPathForVenueDetail,aminity:indexPath)
              cell.layer.cornerRadius = 8
              return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VenueDetailCollectionViewCell", for: indexPath) as! VenueDetailCollectionViewCell
            cell.display(with : indexPath)
              cell.layer.cornerRadius = 8
              return cell
        }
    }
    
    func registerCells() {
        let firstNib = UINib(nibName: "VenueDetailCollectionViewCell", bundle: nil)
        venueCollectionView.register(firstNib, forCellWithReuseIdentifier: "VenueDetailCollectionViewCell")
        let secondNib = UINib(nibName: "VenueDescriptionCollectionViewCell", bundle: nil)
        venueCollectionView.register(secondNib, forCellWithReuseIdentifier: "VenueDescriptionCollectionViewCell")
        let thirdNib = UINib(nibName: "VenueAmenitiesCollectionViewCell", bundle: nil)
        venueCollectionView.register(thirdNib, forCellWithReuseIdentifier: "VenueAmenitiesCollectionViewCell")
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
                
            default : print("Wrong Section")
                return nil
            }
            return section
        }
        return layout
    }
    
    func generateSection1Layout()->NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(290)), subitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 8, leading:5, bottom: 8, trailing: 5)
        group.interItemSpacing = .fixed(8)
        let section = NSCollectionLayoutSection(group: group)
//        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
    func generateSection2Layout()->NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(215)), subitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 8, leading:0, bottom: 8, trailing: 0)
        group.interItemSpacing = .fixed(8)
        let section = NSCollectionLayoutSection(group: group)
//        section.orthogonalScrollingBehavior = .groupPaging
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader,
                                                                 alignment: .top)
        section.boundarySupplementaryItems = [header]
        return section
    }
    func generateSection3Layout()->NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30)), subitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading:0, bottom: 8, trailing: 0)
        group.interItemSpacing = .fixed(8)
        let section = NSCollectionLayoutSection(group: group)
//        section.orthogonalScrollingBehavior = .groupPaging
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader,
                                                                 alignment: .top)
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderForVenueCollectionReusableView", for: indexPath) as! HeaderForVenueCollectionReusableView
        headerView.headerLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        switch indexPath.section {
        case 1:
            headerView.headerLabel.text = DataController.sectionHeadersForVenueDetails[1]
        case 2:
            headerView.headerLabel.text = DataController.sectionHeadersForVenueDetails[2]
        default:
            print("fsg")
        }
        return headerView
    }

    
    
    @IBAction func goToSlotSection(_ sender: Any) {
        let storyboard = UIStoryboard(name: "tabVishwajeet", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "slotVC") as! SlotTableViewController
        vc.indexPathForSlotSection = indexPathForVenueDetail

        self.navigationController?.pushViewController(vc, animated: true)
    }
}
