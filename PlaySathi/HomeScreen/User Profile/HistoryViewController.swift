import UIKit
import FSCalendar

class HistoryViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MatchesCollectionViewCell.identifier, for: indexPath) as! MatchesCollectionViewCell
        cell.dispaly3(with:indexPath)
        cell.layer.cornerRadius = 8
        return cell
    }
    
    
    @IBOutlet weak var collectionViewForHistory: UICollectionView!

    var calendar: FSCalendar!
    
    let graphLayer = CAShapeLayer()
    let dotLayer = CALayer()
    let bpmLabel = UILabel()
    let gradientLayer = CAGradientLayer()
    
    var graphPoints: [CGPoint] = []
    var bpmValues: [Int] = [50, 70, 100, 90, 120, 160, 180] // Corresponding BPM values
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        self.tabBarController?.isTabBarHidden = true
        collectionViewForHistory.setCollectionViewLayout(generateLayout(), animated: true)
        collectionViewForHistory.dataSource = self
        collectionViewForHistory.delegate = self
        
        
        // Initialize FSCalendar
        calendar = FSCalendar()
        calendar.delegate = self
        calendar.dataSource = self
        calendar.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 300)
        calendar.appearance.headerTitleColor = .accent
        calendar.appearance.weekdayTextColor = .darkGray
        calendar.appearance.todayColor = .accent
        calendar.appearance.selectionColor = .accent
        calendar.scope = .week
        
        view.addSubview(calendar)
        
        //calendar.translatesAutoresizingMaskIntoConstraints = false
        
//        NSLayoutConstraint.activate([
//            calendar.topAnchor.constraint(equalTo: .topAnchor),
//            calendar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            calendar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            calendar.bottomAnchor.constraint(equalTo: collectionViewForHistory.topAnchor)
//        ])

    }
    func registerCells() {
        let firstNib = UINib(nibName: MatchesCollectionViewCell.identifier, bundle: nil)
        collectionViewForHistory.register(firstNib, forCellWithReuseIdentifier: MatchesCollectionViewCell.identifier)
    }
    
    // Handle Date Selection
    func calendar(_: FSCalendar, didSelect date: Date, at _: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        print("Selected date: \(formatter.string(from: date))")
        if isLastDayOfTheWeek(selectedDate: date) {
            moveToNextWeek()
        }
    }
 
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Hello")
        let historyVC = HistoryDetailViewController()
        navigationController?.pushViewController(historyVC, animated: true)
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
    
    // Check if Selected Date is the Last Day of the Current Week
    func isLastDayOfTheWeek(selectedDate: Date) -> Bool {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: selectedDate)
        
        // Assuming Sunday is the last day (adjust if needed based on your locale)
        return weekday == 7 // Sunday = 7
    }
    
    // Move Calendar to Next Week Automatically
    func moveToNextWeek() {
        let nextWeek = Calendar.current.date(byAdding: .weekOfYear, value: 1, to: calendar.currentPage)!
        calendar.setCurrentPage(nextWeek, animated: true)
    }
}

extension HistoryViewController: CAAnimationDelegate {
    func animationDidStop(_: CAAnimation, finished flag: Bool) {
        if flag {
            bpmLabel.text = "108"
        }
    }
}
