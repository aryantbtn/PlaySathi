import UIKit

class SetViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private enum Section: Int, CaseIterable {
        case account
        case preferences
        case support
        case about
    }
    
    private struct SettingsItem {
        let title: String
        let icon: String
        let iconBackgroundColor: UIColor
        let action: (() -> Void)?
    }
    
    private var settingsData: [Section: [SettingsItem]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureData()
        setupTableView()
    }
    
    private func setupUI() {
        title = "Settings"
        view.backgroundColor = .systemGroupedBackground
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemGroupedBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SettingsCell")
    }
    
    private func configureData() {
        settingsData = [
            .account: [
                SettingsItem(title: "Account Info", icon: "person.circle.fill", iconBackgroundColor: .systemBlue, action: nil),
                SettingsItem(title: "Password & Security", icon: "lock.fill", iconBackgroundColor: .systemGreen, action: nil)
            ],
            .preferences: [
                SettingsItem(title: "Notifications", icon: "bell.fill", iconBackgroundColor: .systemRed, action: nil),
                SettingsItem(title: "Appearance", icon: "paintbrush.fill", iconBackgroundColor: .systemPurple, action: nil)
            ],
            .support: [
                SettingsItem(title: "Help Center", icon: "questionmark.circle.fill", iconBackgroundColor: .systemOrange, action: nil),
                SettingsItem(title: "Contact Us", icon: "envelope.fill", iconBackgroundColor: .systemBlue, action: nil),
                SettingsItem(title: "Privacy Policy", icon: "hand.raised.fill", iconBackgroundColor: .systemGray, action: nil)
            ],
            .about: [
                SettingsItem(title: "About PlaySathi", icon: "info.circle.fill", iconBackgroundColor: .systemTeal, action: nil),
                SettingsItem(title: "App Version", icon: "number.circle.fill", iconBackgroundColor: .systemGray, action: nil)
            ]
        ]
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension SetViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else { return 0 }
        return settingsData[section]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
        
        guard let section = Section(rawValue: indexPath.section),
              let item = settingsData[section]?[indexPath.row] else {
            return cell
        }
        
        var content = cell.defaultContentConfiguration()
        content.text = item.title
        
        let imageConfig = UIImage.SymbolConfiguration(scale: .medium)
        let image = UIImage(systemName: item.icon, withConfiguration: imageConfig)
        content.image = image
        
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = Section(rawValue: section) else { return nil }
        switch section {
        case .account: return "Account"
        case .preferences: return "Preferences"
        case .support: return "Support"
        case .about: return "About"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let section = Section(rawValue: indexPath.section),
              let item = settingsData[section]?[indexPath.row] else { return }
        
        item.action?()
    }
}

// End of file. No additional code.
