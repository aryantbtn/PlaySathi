// Your imports remain the same
import UIKit
import MapKit

class HistoryDetailViewController: UIViewController {
    private let titleLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Lakshya Game"
            label.font = .systemFont(ofSize: 28, weight: .bold)
            return label
        }()
        
        private let scrollView: UIScrollView = {
            let sv = UIScrollView()
            sv.translatesAutoresizingMaskIntoConstraints = false
            sv.showsVerticalScrollIndicator = false
            return sv
        }()
        
        private let contentView: UIStackView = {
            let sv = UIStackView()
            sv.translatesAutoresizingMaskIntoConstraints = false
            sv.axis = .vertical
            sv.spacing = 24
            sv.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 24, right: 16)
            sv.isLayoutMarginsRelativeArrangement = true
            return sv
        }()
        
        // MARK: - Lifecycle
        override func viewDidLoad() {
            super.viewDidLoad()
            self.title = "Match Details"
            setupUI()
            setupNavigationBar()
        }
        
        // MARK: - Setup
        private func setupNavigationBar() {
            navigationItem.largeTitleDisplayMode = .never
        }
        
        private func setupUI() {
            view.backgroundColor = .systemBackground
            
            // Add scrollView and contentView
            view.addSubview(titleLabel)
            view.addSubview(scrollView)
            scrollView.addSubview(contentView)
            
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
                titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                
                scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
                scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                
                contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            ])
            
            
            // Add venue details
            let venueStack = createVenueSection()
                 contentView.addArrangedSubview(venueStack)
                 
                 let timeLabel = createMatchTimeLabel()
                 contentView.addArrangedSubview(timeLabel)
                 
                 let scoreboardStack = createScoreboardSection()
                 contentView.addArrangedSubview(scoreboardStack)
                 
                 let playersStack = createPlayersSection()
                 contentView.addArrangedSubview(playersStack)
                 
                 let locationStack = createLocationSection()
                 contentView.addArrangedSubview(locationStack)
             }
        private func createSectionWithHeading(title: String, content: UIView) -> UIStackView {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.spacing = 16
            
            let titleLabel = UILabel()
            titleLabel.text = title
            titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
            
            stack.addArrangedSubview(titleLabel)
            stack.addArrangedSubview(content)
            return stack
        }
        
        private func createVenueSection() -> UIStackView {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.spacing = 4
            
            let venueLabel = UILabel()
            venueLabel.text = "RK Sports Academy"
            venueLabel.font = .systemFont(ofSize: 17)
            venueLabel.textColor = .gray
            
            let addressLabel = UILabel()
            addressLabel.text = "Jaypee Greens, Greater Noida\n201308, Uttar Pradesh, India"
            addressLabel.font = .systemFont(ofSize: 17)
            addressLabel.textColor = .gray
            addressLabel.numberOfLines = 0
            
            stack.addArrangedSubview(venueLabel)
            stack.addArrangedSubview(addressLabel)
            return stack
        }
        
        private func createMatchTimeLabel() -> UILabel {
            let label = UILabel()
            label.text = "Tuesday 10 Dec, 2024\nfrom 4PM to 5PM"
            label.textColor = .gray
            label.numberOfLines = 0
            return label
        }
        
        private func createScoreboardSection() -> UIStackView {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.spacing = 12
            
            let titleLabel = UILabel()
            titleLabel.text = "Scoreboard"
            titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
            
            let scoreboardView = ScoreboardView()
            
            stack.addArrangedSubview(titleLabel)
            stack.addArrangedSubview(scoreboardView)
            return stack
        }
        
        private func createPlayersSection() -> UIStackView {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.spacing = 12
            
            let titleLabel = UILabel()
            titleLabel.text = "Players"
            titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
            
            let player1View = PlayerView(name: "Rishabh Rathore", level: "Beginner", points: "Elite: 100 Points", isHost: true)
            let player2View = PlayerView(name: "Alok Kumar", level: "Beginner", points: "Elite: 100 Points", isHost: false)
            
            stack.addArrangedSubview(titleLabel)
            stack.addArrangedSubview(player1View)
            stack.addArrangedSubview(player2View)
            return stack
        }
        
        private func createLocationSection() -> UIStackView {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.spacing = 12
            
            let titleLabel = UILabel()
            titleLabel.text = "Location"
            titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
            
            let mapView = MKMapView()
            mapView.heightAnchor.constraint(equalToConstant: 200).isActive = true
            mapView.layer.cornerRadius = 12
            
            // Set map location
            let coordinate = CLLocationCoordinate2D(latitude: 28.4595, longitude: 77.5021)
            let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(region, animated: false)
            
            stack.addArrangedSubview(titleLabel)
            stack.addArrangedSubview(mapView)
            return stack
        }
    }

    // MARK: - Custom Views
    class ScoreboardView: UIView {
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupUI() {
            layer.borderWidth = 1
            layer.borderColor = UIColor.gray.withAlphaComponent(0.2).cgColor
            layer.cornerRadius = 8
            
            let stack = UIStackView()
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.axis = .vertical
            stack.spacing = 0
            
            addSubview(stack)
            NSLayoutConstraint.activate([
                stack.topAnchor.constraint(equalTo: topAnchor),
                stack.leadingAnchor.constraint(equalTo: leadingAnchor),
                stack.trailingAnchor.constraint(equalTo: trailingAnchor),
                stack.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
            
            // Add header
            stack.addArrangedSubview(createScoreRow(texts: ["Players", "Match 1", "Match 2", "Match 3"], isHeader: true))
            
            // Add player rows
            stack.addArrangedSubview(createScoreRow(texts: ["Rishabh", "21", "18", "21"]))
            stack.addArrangedSubview(createScoreRow(texts: ["Alok", "16", "21", "17"]))
        }
        
        private func createScoreRow(texts: [String], isHeader: Bool = false) -> UIView {
            let container = UIView()
            container.backgroundColor = isHeader ? .gray.withAlphaComponent(0.1) : .clear
            
            let stack = UIStackView()
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.distribution = .fillEqually
            stack.spacing = 8
            stack.layoutMargins = UIEdgeInsets(top: 12, left: 8, bottom: 12, right: 8)
            stack.isLayoutMarginsRelativeArrangement = true
            
            container.addSubview(stack)
            NSLayoutConstraint.activate([
                stack.topAnchor.constraint(equalTo: container.topAnchor),
                stack.leadingAnchor.constraint(equalTo: container.leadingAnchor),
                stack.trailingAnchor.constraint(equalTo: container.trailingAnchor),
                stack.bottomAnchor.constraint(equalTo: container.bottomAnchor)
            ])
            
            texts.forEach { text in
                let label = UILabel()
                label.text = text
                label.textAlignment = text == texts.first ? .left : .center
                stack.addArrangedSubview(label)
            }
            
            return container
        }
    }

    class PlayerView: UIView {
        init(name: String, level: String, points: String, isHost: Bool) {
            super.init(frame: .zero)
            setupUI(name: name, level: level, points: points, isHost: isHost)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupUI(name: String, level: String, points: String, isHost: Bool) {
            backgroundColor = .white
            layer.cornerRadius = 12
            layer.shadowColor = UIColor.gray.cgColor
            layer.shadowOpacity = 0.1
            layer.shadowRadius = 5
            layer.shadowOffset = CGSize(width: 0, height: 2)
            
            let stack = UIStackView()
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.spacing = 12
            stack.alignment = .center
            stack.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
            stack.isLayoutMarginsRelativeArrangement = true
            
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(systemName: "person.circle.fill")
            imageView.tintColor = .gray
            imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            
            let textStack = UIStackView()
            textStack.axis = .vertical
            textStack.spacing = 4
            
            let nameStack = UIStackView()
            nameStack.spacing = 8
            
            let nameLabel = UILabel()
            nameLabel.text = name
            nameLabel.font = .systemFont(ofSize: 16, weight: .semibold)
            
            nameStack.addArrangedSubview(nameLabel)
            
            if isHost {
                let hostLabel = UILabel()
                hostLabel.text = "HOST"
                hostLabel.font = .systemFont(ofSize: 12)
                hostLabel.textColor = .systemGreen
                hostLabel.backgroundColor = .systemGreen.withAlphaComponent(0.2)
                hostLabel.layer.cornerRadius = 4
                hostLabel.clipsToBounds = true
                hostLabel.textAlignment = .center
                hostLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
                nameStack.addArrangedSubview(hostLabel)
            }
            
            let levelLabel = UILabel()
            levelLabel.text = level
            levelLabel.font = .systemFont(ofSize: 14)
            levelLabel.textColor = .gray
            
            let pointsLabel = UILabel()
            pointsLabel.text = points
            pointsLabel.font = .systemFont(ofSize: 12)
            pointsLabel.textColor = .gray
            
            textStack.addArrangedSubview(nameStack)
            textStack.addArrangedSubview(levelLabel)
            textStack.addArrangedSubview(pointsLabel)
            
            stack.addArrangedSubview(imageView)
            stack.addArrangedSubview(textStack)
            
            addSubview(stack)
            NSLayoutConstraint.activate([
                stack.topAnchor.constraint(equalTo: topAnchor),
                stack.leadingAnchor.constraint(equalTo: leadingAnchor),
                stack.trailingAnchor.constraint(equalTo: trailingAnchor),
                stack.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        }

}

//extension HistoryDetailViewController: MatchesCollectionViewCellDelegate {
//    func didTapCell() {
//        let historyVC = HistoryDetailViewController()
//        navigationController?.pushViewController(historyVC, animated: true)
//    }
//}
