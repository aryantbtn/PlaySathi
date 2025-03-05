import UIKit

class ScoreboardViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var updateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Scoreboard"
        setupScoreboardTable()
        setupGestureToDismissKeyboard()
        image1.layer.borderWidth = 2
        image1.layer.borderColor = UIColor.accent.cgColor
        image1.layer.cornerRadius = image1.bounds.width/2
        image2.layer.cornerRadius = image2.bounds.width/2
        image2.layer.borderWidth = 2
        image2.layer.borderColor = UIColor.accent.cgColor
       
              setupUpdateButton()
    }
    private func setupUpdateButton() {
            updateButton.backgroundColor = .accent
            updateButton.layer.cornerRadius = 12
            
            // Update button text styling
            updateButton.setTitle("Update", for: .normal) // Ensure title is set
            updateButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
            updateButton.setTitleColor(.white, for: .normal)
            
            // Adjust padding
            updateButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 24, bottom: 12, right: 24)
            
            // Add shadow effect
            updateButton.layer.shadowColor = UIColor.black.cgColor
            updateButton.layer.shadowOffset = CGSize(width: 0, height: 2)
            updateButton.layer.shadowRadius = 4
            updateButton.layer.shadowOpacity = 0.1
            
            // Update button constraints
            updateButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                updateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
                updateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
                updateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
                updateButton.heightAnchor.constraint(equalToConstant: 54)
            ])
        }
    


    func setupScoreboardTable() {

        let tableContainer = UIView()
        tableContainer.backgroundColor = UIColor.systemGray6
        tableContainer.layer.cornerRadius = 10
        tableContainer.layer.borderWidth = 1
        tableContainer.layer.borderColor = UIColor.lightGray.cgColor
        tableContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableContainer)


        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .fill
        verticalStackView.distribution = .fillEqually
        verticalStackView.spacing = 5
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        tableContainer.addSubview(verticalStackView)

  
        let headers = ["Name", "Match 1", "Match 2", "Match 3"]
        let players = ["Rishabh", "Alok"]
        
  
        let headerRow = createRow(with: headers, isHeader: true)
        verticalStackView.addArrangedSubview(headerRow)

       
        for player in players {
            let row = createRow(with: [player, "", "", ""], isHeader: false)
            verticalStackView.addArrangedSubview(row)
        }

      
        NSLayoutConstraint.activate([
            tableContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 335), // Adjust position
            tableContainer.widthAnchor.constraint(equalToConstant: 300),
            tableContainer.heightAnchor.constraint(equalToConstant: 150),

            verticalStackView.topAnchor.constraint(equalTo: tableContainer.topAnchor, constant: 5),
            verticalStackView.bottomAnchor.constraint(equalTo: tableContainer.bottomAnchor, constant: -5),
            verticalStackView.leadingAnchor.constraint(equalTo: tableContainer.leadingAnchor, constant: 5),
            verticalStackView.trailingAnchor.constraint(equalTo: tableContainer.trailingAnchor, constant: -5)
        ])
    }


    func createRow(with values: [String], isHeader: Bool) -> UIStackView {
        let rowStackView = UIStackView()
        rowStackView.axis = .horizontal
        rowStackView.alignment = .fill
        rowStackView.distribution = .fillEqually
        rowStackView.spacing = 5

        for value in values {
            if isHeader {
                let label = createLabel(with: value, isBold: true)
                rowStackView.addArrangedSubview(label)
            } else {
                if value == "Rishabh" || value == "Alok" {
                    let label = createLabel(with: value, isBold: false)
                    rowStackView.addArrangedSubview(label)
                } else {
                    let textField = createTextField()
                    rowStackView.addArrangedSubview(textField)
                }
            }
        }
        return rowStackView
    }


    func createLabel(with text: String, isBold: Bool) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.font = isBold ? UIFont.boldSystemFont(ofSize: 14) : UIFont.systemFont(ofSize: 14)
        label.backgroundColor = UIColor.white
        label.layer.borderWidth = 0
        label.layer.borderColor = UIColor.black.cgColor
        return label
    }


    func createTextField() -> UITextField {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.keyboardType = .numberPad
        textField.backgroundColor = UIColor.white
        textField.layer.borderWidth = 0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.delegate = self
        return textField
    }


    func setupGestureToDismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

 
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    @IBAction func updateButtonTapped(_ sender: Any) {
        if let navigationController = self.navigationController,
           
           let homeVC = navigationController.viewControllers.first as? HomeScreenViewController {
            listOfSections.remove(at: 1)
            homeVC.collectionView.reloadData()
            var userP : UserProfileTableViewController?
            userP?.elite = "66"
            userP?.win = "66"
            userP?.number = "3"
            navigationController.popToRootViewController(animated: true)
        }
        
    }
}
