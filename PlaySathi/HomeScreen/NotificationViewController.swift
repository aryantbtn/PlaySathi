import UIKit

class NotificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Create tableView programmatically
    private lazy var notificationTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private var notifications: [String] = []  {      didSet {
        // Save notifications whenever they change
        UserDefaults.standard.set(notifications, forKey: "savedNotifications")
    }
}

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        setupNotificationObserver()
        loadSavedNotifications()

    }
    private func loadSavedNotifications() {
            if let savedNotifications = UserDefaults.standard.array(forKey: "savedNotifications") as? [String] {
                notifications = savedNotifications
                notificationTableView.reloadData()
            }
        }

    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Notifications"
        
        // Add table view to view hierarchy
        view.addSubview(notificationTableView)
        
        // Setup constraints
        NSLayoutConstraint.activate([
            notificationTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            notificationTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            notificationTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            notificationTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupTableView() {
        notificationTableView.delegate = self
        notificationTableView.dataSource = self
        notificationTableView.register(UITableViewCell.self, forCellReuseIdentifier: "NotificationCell")
    }
    
    private func setupNotificationObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleGameNotification),
            name: Notification.Name("GameNotification"),
            object: nil
        )
    }
    
    @objc private func handleGameNotification(_ notification: Notification) {
        guard let message = notification.userInfo?["message"] as? String else { return }
        
        DispatchQueue.main.async { [weak self] in
            self?.notifications.insert(message, at: 0)
            self?.notificationTableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                notifications.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = notifications[indexPath.row]
        content.textProperties.color = .label
        content.textProperties.font = .systemFont(ofSize: 16)
        cell.contentConfiguration = content
        return cell
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// End of file. No additional code.
