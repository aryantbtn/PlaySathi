import UIKit

class ScoreboardViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScoreboardTable()
        setupGestureToDismissKeyboard()
    }

    func setupScoreboardTable() {

        let tableContainer = UIView()
        tableContainer.backgroundColor = UIColor.systemGray6
        tableContainer.layer.cornerRadius = 10
        tableContainer.layer.borderWidth = 1
        tableContainer.layer.borderColor = UIColor.lightGray.cgColor
        tableContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableContainer)

        // Create a vertical stack view for rows
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .fill
        verticalStackView.distribution = .fillEqually
        verticalStackView.spacing = 5
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        tableContainer.addSubview(verticalStackView)

        // Define table data (Static Names, Editable Scores)
        let headers = ["Name", "Match 1", "Match 2", "Match 3"]
        let players = ["Rishabh", "Alok"]
        
        // Create Header Row
        let headerRow = createRow(with: headers, isHeader: true)
        verticalStackView.addArrangedSubview(headerRow)

        // Create Player Rows
        for player in players {
            let row = createRow(with: [player, "", "", ""], isHeader: false)
            verticalStackView.addArrangedSubview(row)
        }

        // Add constraints for table container
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

    // Function to create a row with labels or text fields
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

    // Function to create UILabel
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

    // Function to create UITextField
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

    // Function to dismiss keyboard when tapping outside
    func setupGestureToDismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    // Restrict UITextField input to numbers only
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
