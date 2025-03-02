// Your imports remain the same
import UIKit
class PointSystemViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemGroupedBackground
        return table
    }()
    
    private struct PointItem {
        let title: String
        let points: String
        let subtitle: String?
    }
    
    private enum Section: Int, CaseIterable {
        case points
        case levels
    }
    
    private var pointsData: [[PointItem]] = [
        [
            PointItem(title: "App Download", points: "100 Points", subtitle: nil),
            PointItem(title: "Refer Friend", points: "20 Points", subtitle: nil),
            PointItem(title: "Referring Vouchers/Code", points: "20 Points", subtitle: nil),
            PointItem(title: "Win", points: "40 Points", subtitle: "if both players are of same level"),
            PointItem(title: "LOSS", points: "-20 Points", subtitle: "if both players are of same level"),
            PointItem(title: "Did not show up (DNS)", points: "-50 Points", subtitle: nil)
        ],
        
        [
            PointItem(title: "Amateur", points: "0-500", subtitle: nil),
            PointItem(title: "Semi Pro", points: "500-1500", subtitle: nil),
            PointItem(title: "Pro", points: "1500-3000", subtitle: nil),
            PointItem(title: "Expert", points: "3000 Plus", subtitle: nil)
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup
    private func setupUI() {
        title = "Point System"
        view.backgroundColor = .systemBackground
        
        // Setup TableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PointCell")
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDelegate & DataSource
extension PointSystemViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pointsData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PointCell", for: indexPath)
        let item = pointsData[indexPath.section][indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = item.title
        content.secondaryText = item.points
        
        if let subtitle = item.subtitle {
            content.text = "\(item.title) (\(subtitle))"
        }
        
        let imageConfig = UIImage.SymbolConfiguration(scale: .medium)
        content.image = UIImage(systemName: "star.fill", withConfiguration: imageConfig)
        content.imageProperties.tintColor = .systemBlue
        
        cell.contentConfiguration = content
        cell.backgroundColor = .systemBackground
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch Section(rawValue: section) {
        case .points:
            return nil
        case .levels:
            return "Point bracket for each level"
        case .none:
            return nil
        }
    }
}

