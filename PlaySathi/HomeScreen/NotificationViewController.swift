// Your imports remain the same
import UIKit


// Your imports remain the same

class NotificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // Remove outlet and create programmatic tableView
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    // Add notifications array
    private var notifications: [(message: String, timestamp: Date)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set title
        self.title = "Notifications"
        
        // Setup tableView
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "NotificationCell")
        
        // Add notification observer
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleGameAccepted(_:)),
            name: NSNotification.Name("GameAccepted"),
            object: nil
        )
    }
    
    // TableView data source methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath)
        let notification = notifications[indexPath.row]
        cell.textLabel?.text = notification.message
        return cell
    }
    
    @objc private func handleGameAccepted(_ notification: Notification) {
        print("Received notification: \(notification)")
        guard let playerName = notification.userInfo?["playerName"] as? String else {
            print("No player name found in notification")
            return
        }
        
        let message = "\(playerName) accepted your game request"
        print("Adding message: \(message)")
        notifications.insert((message: message, timestamp: Date()), at: 0)
        
        DispatchQueue.main.async { [weak self] in
            print("Reloading table with \(self?.notifications.count ?? 0) notifications")
            self?.tableView.reloadData()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// End of file
