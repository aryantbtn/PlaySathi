import UIKit


class WeeklyAvailabilityViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var userData: SignUpData?
    
    private let scrollView: UIScrollView = {
            let scroll = UIScrollView()
            scroll.translatesAutoresizingMaskIntoConstraints = false
            return scroll
        }()
        
        private let contentView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        private let profileImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.backgroundColor = .systemGray5
            imageView.layer.cornerRadius = 50
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        private let imagePickerButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Edit Photo", for: .normal)
            button.tintColor = .systemBlue
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        private let locationLabel: UILabel = {
            let label = UILabel()
            label.text = "Location"
            label.font = .systemFont(ofSize: 16, weight: .medium)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let locationTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Enter your location"
            textField.borderStyle = .roundedRect
            textField.translatesAutoresizingMaskIntoConstraints = false
            return textField
        }()
        
        private let availabilityLabel: UILabel = {
            let label = UILabel()
            label.text = "Weekly Availability"
            label.font = .systemFont(ofSize: 16, weight: .medium)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let weekdayStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.distribution = .fillEqually
            stack.spacing = 8
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        }()
    
    private lazy var selectedDayView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray3.cgColor
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var selectedDayLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Done", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
        
        private let genderLabel: UILabel = {
            let label = UILabel()
            label.text = "Gender"
            label.font = .systemFont(ofSize: 16, weight: .medium)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let genderSelectionView: UIView = {
            let view = UIView()
            view.backgroundColor = .systemGray6
            view.layer.cornerRadius = 12
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        private let genderButtons: [UIButton] = ["Male", "Female", "Other"].map { gender in
            let button = UIButton(type: .system)
            button.setTitle(gender, for: .normal)
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 20
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.systemGray3.cgColor
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }
        
        private let sectionSpacing: CGFloat = 40
        
        private lazy var timePickerContainer: UIView = {
            let view = UIView()
            view.backgroundColor = .white
            view.layer.cornerRadius = 12
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOffset = CGSize(width: 0, height: 2)
            view.layer.shadowRadius = 6
            view.layer.shadowOpacity = 0.1
            view.isHidden = true
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        private lazy var timePicker: UIDatePicker = {
            let picker = UIDatePicker()
            picker.datePickerMode = .time
            picker.preferredDatePickerStyle = .wheels
            picker.translatesAutoresizingMaskIntoConstraints = false
            return picker
        }()
        
        private var weekdayButtons: [UIButton] = []
        private let weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
        
        private var selectedDayButton: UIButton?
        private var selectedDays: [String: Date] = [:]
        
        private let selectedDaysStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.spacing = 12
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        }()
        
        private let genderStackView: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.distribution = .fillEqually
            stack.spacing = 20
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        }()
        
        private let maleButton: UIButton = {
            let button = UIButton()
            button.setTitle("Male", for: .normal)
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 25
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.systemGray3.cgColor
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        private let femaleButton: UIButton = {
            let button = UIButton()
            button.setTitle("Female", for: .normal)
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 25
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.systemGray3.cgColor
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        private let defaultSpacing: CGFloat = 20
        private let expandedSpacing: CGFloat = 120
        
        private lazy var timePickerContainerTopConstraint: NSLayoutConstraint = timePickerContainer.topAnchor.constraint(equalTo: selectedDaysStack.bottomAnchor, constant: 16)
        
        private lazy var genderLabelTopConstraint: NSLayoutConstraint = genderLabel.topAnchor.constraint(equalTo: selectedDaysStack.bottomAnchor, constant: defaultSpacing)
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
            setupActions()
            setupGenderSelection()
        }
        
        private func setupUI() {
            view.backgroundColor = .white
            
            view.addSubview(scrollView)
            scrollView.addSubview(contentView)
            
            contentView.addSubview(profileImageView)
            contentView.addSubview(imagePickerButton)
            contentView.addSubview(locationLabel)
            contentView.addSubview(locationTextField)
            contentView.addSubview(availabilityLabel)
            contentView.addSubview(weekdayStack)
            contentView.addSubview(genderLabel)
            contentView.addSubview(selectedDayView)
            selectedDayView.addSubview(selectedDayLabel)
            selectedDayView.addSubview(timePicker)
            selectedDayView.addSubview(doneButton)
            contentView.addSubview(genderStackView)
            genderStackView.addArrangedSubview(maleButton)
            genderStackView.addArrangedSubview(femaleButton)
            maleButton.addTarget(self, action: #selector(genderButtonTapped(_:)), for: .touchUpInside)
            femaleButton.addTarget(self, action: #selector(genderButtonTapped(_:)), for: .touchUpInside)
            contentView.addSubview(selectedDaysStack)
            contentView.addSubview(timePickerContainer)
            timePickerContainer.addSubview(timePicker)
            
            setupWeekdayButtons()
            setupConstraints()
        }
        
        private func setupWeekdayButtons() {
            for day in weekdays {
                let button = UIButton(type: .system)
                button.setTitle(day, for: .normal)
                button.backgroundColor = .systemGray5
                button.layer.cornerRadius = 8
                button.addTarget(self, action: #selector(weekdayButtonTapped(_:)), for: .touchUpInside)
                weekdayButtons.append(button)
                weekdayStack.addArrangedSubview(button)
            }
        }
        
        private func setupConstraints() {
            NSLayoutConstraint.activate([
                scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                
                contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                
                profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                profileImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                profileImageView.widthAnchor.constraint(equalToConstant: 100),
                profileImageView.heightAnchor.constraint(equalToConstant: 100),
                
                imagePickerButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8),
                imagePickerButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                
                locationLabel.topAnchor.constraint(equalTo: imagePickerButton.bottomAnchor, constant: 20),
                locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                
                locationTextField.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 8),
                locationTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                locationTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                
                availabilityLabel.topAnchor.constraint(equalTo: locationTextField.bottomAnchor, constant: 20),
                availabilityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                
                weekdayStack.topAnchor.constraint(equalTo: availabilityLabel.bottomAnchor, constant: defaultSpacing),
                weekdayStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                weekdayStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                weekdayStack.heightAnchor.constraint(equalToConstant: 40),
                
                selectedDaysStack.topAnchor.constraint(equalTo: weekdayStack.bottomAnchor, constant: defaultSpacing),
                selectedDaysStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                selectedDaysStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                
                timePickerContainerTopConstraint,
                timePickerContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                timePickerContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                timePickerContainer.heightAnchor.constraint(equalToConstant: 100),
                
                timePicker.centerXAnchor.constraint(equalTo: timePickerContainer.centerXAnchor),
                timePicker.centerYAnchor.constraint(equalTo: timePickerContainer.centerYAnchor),
                
                genderLabelTopConstraint,
                genderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                
                genderStackView.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 16),
                genderStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                genderStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                genderStackView.heightAnchor.constraint(equalToConstant: 50),
                genderStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
                selectedDayView.topAnchor.constraint(equalTo: weekdayStack.bottomAnchor, constant: 20),
                selectedDayView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                selectedDayView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                selectedDayView.heightAnchor.constraint(equalToConstant: 120),

                selectedDayLabel.topAnchor.constraint(equalTo: selectedDayView.topAnchor, constant: 16),
                selectedDayLabel.leadingAnchor.constraint(equalTo: selectedDayView.leadingAnchor, constant: 16),

                timePicker.topAnchor.constraint(equalTo: selectedDayLabel.bottomAnchor, constant: 8),
                timePicker.centerXAnchor.constraint(equalTo: selectedDayView.centerXAnchor),

                doneButton.bottomAnchor.constraint(equalTo: selectedDayView.bottomAnchor, constant: -16),
                doneButton.trailingAnchor.constraint(equalTo: selectedDayView.trailingAnchor, constant: -16),
            ])
        }
        
        private func setupActions() {
            imagePickerButton.addTarget(self, action: #selector(imagePickerButtonTapped), for: .touchUpInside)
        }
        
        private func setupGenderSelection() {
            for button in genderButtons {
                button.addTarget(self, action: #selector(genderButtonTapped(_:)), for: .touchUpInside)
            }
        }
        
        @objc private func imagePickerButtonTapped() {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated: true)
        }
        
    @objc private func weekdayButtonTapped(_ sender: UIButton) {
        guard let day = sender.title(for: .normal) else { return }
        
        weekdayButtons.forEach { $0.backgroundColor = .systemGray5 }
        sender.backgroundColor = .systemBlue
        
        selectedDayLabel.text = "Select time for \(day)"
        selectedDayView.isHidden = false
        timePicker.date = selectedDays[day] ?? Date()
    }
    
    @objc private func doneButtonTapped() {
        guard let selectedDay = selectedDayLabel.text?.components(separatedBy: "Select time for ").last,
              let selectedButton = weekdayButtons.first(where: { $0.title(for: .normal) == selectedDay }) else { return }
        
        selectedDays[selectedDay] = timePicker.date
        selectedDayView.isHidden = true
        selectedButton.backgroundColor = .systemBlue
        updateSelectedDaysView()
    }
        
    private func updateSelectedDaysView() {
        selectedDaysStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for (day, time) in selectedDays.sorted(by: { $0.key < $1.key }) {
            let dayRow = UIView()
            dayRow.translatesAutoresizingMaskIntoConstraints = false
            
            let dayLabel = UILabel()
            dayLabel.text = day
            dayLabel.font = .systemFont(ofSize: 16, weight: .medium)
            dayLabel.translatesAutoresizingMaskIntoConstraints = false
            
            let timeLabel = UILabel()
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:00"
            timeLabel.text = formatter.string(from: time)
            timeLabel.font = .systemFont(ofSize: 16)
            timeLabel.translatesAutoresizingMaskIntoConstraints = false
            
            dayRow.addSubview(dayLabel)
            dayRow.addSubview(timeLabel)
            
            NSLayoutConstraint.activate([
                dayLabel.leadingAnchor.constraint(equalTo: dayRow.leadingAnchor),
                dayLabel.centerYAnchor.constraint(equalTo: dayRow.centerYAnchor),
                
                timeLabel.trailingAnchor.constraint(equalTo: dayRow.trailingAnchor),
                timeLabel.centerYAnchor.constraint(equalTo: dayRow.centerYAnchor),
                
                dayRow.heightAnchor.constraint(equalToConstant: 40)
            ])
            
            selectedDaysStack.addArrangedSubview(dayRow)
        }
    }
        
        @objc private func timeChanged(_ sender: UIDatePicker) {
            let sortedDays = selectedDays.keys.sorted()
            if sender.tag < sortedDays.count {
                let day = sortedDays[sender.tag]
                selectedDays[day] = sender.date
                updateSelectedDaysView()
            }
        }
        
        @objc private func genderButtonTapped(_ sender: UIButton) {
            let buttons = [maleButton, femaleButton]
            buttons.forEach { button in
                button.backgroundColor = button == sender ? .systemBlue : .white
                button.setTitleColor(button == sender ? .white : .black, for: .normal)
            }
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                profileImageView.image = image
            }
            picker.dismiss(animated: true)
        }
    
    
    @IBAction func ok(_ sender: Any) {
        
        guard let userData = userData
//              let location = lo.text,
//              let time = ti.text,
//              let imageUrl = imm.text
        else {
            return
        }
        
        let availabilityString = selectedDays.map { day, time -> String in
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:00"
            return "\(day): \(formatter.string(from: time))"
        }.joined(separator: ", ")
        
        let selectedGender = maleButton.backgroundColor == .systemBlue ? "Male" : "Female"
        
        Task {
            do {
                try await SupabaseAuthanticationManager.shared.getClient().from("Player").insert([
                    "id": userData.id.uuidString,
                    "email": userData.email,
                    "name": userData.name,
                    "contactNumber": userData.contactNumber,
                    "playerImage": "",
                    "location": locationTextField.text ?? "",
                    "availableTime": availabilityString,
                    "gender": selectedGender
                ]).execute()
                
                DispatchQueue.main.async {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "main") as! MainTabBarController
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            } catch {
                print("Error inserting user data: \(error)")
            }
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "main") as! MainTabBarController
       // self.navigationController?.pushViewController(vc, animated: true)
    }
}
