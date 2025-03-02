import UIKit

class HelpViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "HelpCell")
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemBackground
        return table
    }()
    
    private let searchBar: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "Search help articles"
        search.translatesAutoresizingMaskIntoConstraints = false
        search.searchBarStyle = .minimal
        return search
    }()
    
    private struct HelpItem {
        let title: String
        let content: String
    }
    
    private let helpItems: [HelpItem] = [
        HelpItem(
            title: "How to Find and Book Courts",
            content: "1. Open the Venues tab\n2. Browse available courts near you\n3. Select your preferred date and time\n4. Choose available slots\n5. Confirm and pay for your booking\n\nYou can filter venues by location, price, and available amenities."
        ),
        HelpItem(
            title: "Understanding ELLo Rating System",
            content: "ELLo is PlaySathi's rating system that measures your skill level:\n\n• Start at 1000 points\n• Win matches to earn points\n• Higher-rated opponents = more points\n• Progress through Beginner, Intermediate, and Advanced levels\n• Rankings help match you with similar players"
        ),
        HelpItem(
            title: "Finding Players for a Match",
            content: "Find playing partners:\n\n1. Go to the Players tab\n2. Filter by skill level and game type\n3. View player profiles and stats\n4. Send match requests\n5. Coordinate time and venue\n\nYou can also join existing games or create your own."
        ),
        HelpItem(
            title: "Manage Your Profile Settings",
            content: "Customize your profile:\n\n• Update personal information\n• Set playing preferences\n• Manage notification settings\n• Link payment methods\n• View your game history and stats\n• Set availability schedule"
        ),
        HelpItem(
            title: "Booking Rules and Cancellations",
            content: "Booking policies:\n\n• Book up to 7 days in advance\n• Cancel 24 hours before for full refund\n• 50% refund for cancellations within 24 hours\n• No-show policy may affect your account\n• Reschedule option available when possible"
        ),
        HelpItem(
            title: "Payment Methods and Refunds",
            content: "Payment information:\n\n• Accepted methods: Credit/Debit cards, UPI\n• Secure payment processing\n• Automatic refunds for eligible cancellations\n• Digital receipts provided\n• View transaction history in app"
        ),
        HelpItem(
            title: "Reporting Issues with Courts",
            content: "Report problems:\n\n1. Go to your booking details\n2. Click 'Report Issue'\n3. Select issue type\n4. Add photos if needed\n5. Submit report\n\nOur team will respond within 24 hours."
        ),
        HelpItem(
            title: "Contact Support Team",
            content: "Get help:\n\n• Email: support@playsathi.com\n• In-app chat: 9 AM - 6 PM\n• Phone: 1800-XXX-XXXX\n• Response time: Within 24 hours\n• Emergency contact available for urgent issues"
        )
    ]
    
    private var filteredItems: [HelpItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        filteredItems = helpItems
    }
    
    private func setupUI() {
        title = "Help"
        view.backgroundColor = .systemBackground
        
        view.addSubview(searchBar)
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - TableView DataSource & Delegate
extension HelpViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HelpCell", for: indexPath)
        cell.textLabel?.text = filteredItems[indexPath.row].title
        cell.imageView?.image = UIImage(systemName: "doc.text")
        cell.imageView?.tintColor = .systemGray
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showHelpDetails(for: filteredItems[indexPath.row])
    }
    
    private func showHelpDetails(for helpItem: HelpItem) {
        let detailVC = UIViewController()
        detailVC.title = helpItem.title
        detailVC.view.backgroundColor = .systemBackground
        
        let textView = UITextView()
        textView.text = helpItem.content
        textView.font = .systemFont(ofSize: 16)
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        detailVC.view.addSubview(textView)
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: detailVC.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            textView.leadingAnchor.constraint(equalTo: detailVC.view.leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: detailVC.view.trailingAnchor, constant: -16),
            textView.bottomAnchor.constraint(equalTo: detailVC.view.bottomAnchor, constant: -16)
        ])
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: - SearchBar Delegate
extension HelpViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredItems = helpItems
        } else {
            filteredItems = helpItems.filter {
                $0.title.lowercased().contains(searchText.lowercased()) ||
                $0.content.lowercased().contains(searchText.lowercased())
            }
        }
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

