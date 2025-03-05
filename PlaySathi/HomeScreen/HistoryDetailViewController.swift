// Your imports remain the same
import UIKit
class HistoryDetailViewController: UIViewController {
    
    // Add these properties
    private let gameNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let venueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let scoreboardLabel: UILabel = {
        let label = UILabel()
        label.text = "Scoreboard"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let playersLabel: UILabel = {
        let label = UILabel()
        label.text = "Players"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupNavigationBar()
        setupUI()
        configureData()
    }
    
    private func setupNavigationBar() {
        title = "Match Details"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .plain,
            target: self,
            action: #selector(backButtonTapped)
        )
        navigationItem.leftBarButtonItem?.tintColor = .systemBlue
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setupUI() {
        // Add views to hierarchy
        [gameNameLabel, venueLabel, dateTimeLabel, scoreboardLabel, playersLabel].forEach { view.addSubview($0) }
        
        // Setup constraints
        NSLayoutConstraint.activate([
            gameNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            gameNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            venueLabel.topAnchor.constraint(equalTo: gameNameLabel.bottomAnchor, constant: 8),
            venueLabel.leadingAnchor.constraint(equalTo: gameNameLabel.leadingAnchor),
            
            dateTimeLabel.topAnchor.constraint(equalTo: venueLabel.bottomAnchor, constant: 8),
            dateTimeLabel.leadingAnchor.constraint(equalTo: gameNameLabel.leadingAnchor),
            
            scoreboardLabel.topAnchor.constraint(equalTo: dateTimeLabel.bottomAnchor, constant: 24),
            scoreboardLabel.leadingAnchor.constraint(equalTo: gameNameLabel.leadingAnchor),
            
            playersLabel.topAnchor.constraint(equalTo: scoreboardLabel.bottomAnchor, constant: 200),
            playersLabel.leadingAnchor.constraint(equalTo: gameNameLabel.leadingAnchor)
        ])
    }
    
    private func configureData() {
        gameNameLabel.text = "Lakshya Game"
        venueLabel.text = "RK Sports Academy\nJaypee Greens, Greater Noida\n201308, Uttar Pradesh, India"
        dateTimeLabel.text = "Tuesday 10 Dec, 2024\nfrom 4PM to 5PM"
    }
}

extension HistoryDetailViewController: MatchesCollectionViewCellDelegate {
    func didTapCell() {
        let historyVC = HistoryDetailViewController()
        navigationController?.pushViewController(historyVC, animated: true)
    }
}
