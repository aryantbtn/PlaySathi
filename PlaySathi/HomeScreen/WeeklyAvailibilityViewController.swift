import UIKit


class WeeklyAvailabilityViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var userData: SignUpData?
    
    
    
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Set Your Play Time"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemGray6
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.systemBlue.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            // Update UI
            profileImageView.image = selectedImage
            
            // Convert image to base64 string for storage
            if let imageData = selectedImage.jpegData(compressionQuality: 0.5) {
                let base64String = imageData.base64EncodedString()
                // Store this base64String in your player data
            }
        }
        picker.dismiss(animated: true)
    }
    
    private let imagePickerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Edit Photo", for: .normal)
        button.tintColor = .systemBlue
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let locationContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray4.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let locationIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "location.fill")
        imageView.tintColor = .systemBlue
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let locationTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your location"
        textField.font = .systemFont(ofSize: 16)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let weekdayStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var weekdayButtons: [UIButton] = []
    private let weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    private var selectedDays: [String: Date] = [:]
    
    private let selectedDayView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 15
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 6
        view.layer.shadowOpacity = 0.1
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let selectedDayLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        picker.minuteInterval = 60
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private let selectedDaysStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let genderStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let maleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Male", for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let femaleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Female", for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Done", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let shuttleImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "shuttle"))
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let okButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("OK", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func setupWeekdayButtons() {
        for day in weekdays {
            let button = UIButton(type: .system)
            button.setTitle(day, for: .normal)
            button.backgroundColor = .systemGray6
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
            button.layer.cornerRadius = 12
            button.heightAnchor.constraint(equalToConstant: 40).isActive = true
            button.addTarget(self, action: #selector(weekdayButtonTapped(_:)), for: .touchUpInside)
            weekdayButtons.append(button)
            weekdayStack.addArrangedSubview(button)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        setupConstraints()
        setupWeekdayButtons()
        setupActions()
        animateUI()
    }
    
    private func setupUI() {
        // Add subviews
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [headerLabel, profileImageView, imagePickerButton, locationContainer, weekdayStack,
         selectedDayView, selectedDaysStack, genderStack, shuttleImageView, okButton].forEach(contentView.addSubview)
        
        locationContainer.addSubview(locationIconView)
        locationContainer.addSubview(locationTextField)
        
        selectedDayView.addSubview(selectedDayLabel)
        selectedDayView.addSubview(timePicker)
        selectedDayView.addSubview(doneButton)
        
        genderStack.addArrangedSubview(maleButton)
        genderStack.addArrangedSubview(femaleButton)
    }
    
    private func animateUI() {
        // Initial state
        let views = [headerLabel, profileImageView, locationContainer, weekdayStack, genderStack]
        views.forEach { $0.alpha = 0 }
        
        // Animate elements
        UIView.animate(withDuration: 0.6, delay: 0.2, options: .curveEaseOut) {
            views.forEach { $0.alpha = 1 }
        }
    }
    
    private func setupActions() {
        imagePickerButton.addTarget(self, action: #selector(imagePickerButtonTapped), for: .touchUpInside)
        maleButton.addTarget(self, action: #selector(genderButtonTapped(_:)), for: .touchUpInside)
        femaleButton.addTarget(self, action: #selector(genderButtonTapped(_:)), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
        okButton.addTarget(self, action: #selector(okButtonTapped), for: .touchUpInside)
    }
    
    
    // Add these methods right before the @IBAction ok method
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -30),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            headerLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            profileImageView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            profileImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            
            imagePickerButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8),
            imagePickerButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            locationContainer.topAnchor.constraint(equalTo: imagePickerButton.bottomAnchor, constant: 24),
            locationContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            locationContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            locationContainer.heightAnchor.constraint(equalToConstant: 50),
            
            locationIconView.leadingAnchor.constraint(equalTo: locationContainer.leadingAnchor, constant: 12),
            locationIconView.centerYAnchor.constraint(equalTo: locationContainer.centerYAnchor),
            locationIconView.widthAnchor.constraint(equalToConstant: 20),
            locationIconView.heightAnchor.constraint(equalToConstant: 20),
            
            locationTextField.leadingAnchor.constraint(equalTo: locationIconView.trailingAnchor, constant: 8),
            locationTextField.trailingAnchor.constraint(equalTo: locationContainer.trailingAnchor, constant: -12),
            locationTextField.centerYAnchor.constraint(equalTo: locationContainer.centerYAnchor),
            
            weekdayStack.topAnchor.constraint(equalTo: locationContainer.bottomAnchor, constant: 24),
            weekdayStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            weekdayStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            weekdayStack.heightAnchor.constraint(equalToConstant: 40),
            
            selectedDayView.topAnchor.constraint(equalTo: weekdayStack.bottomAnchor, constant: 16),
            selectedDayView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            selectedDayView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            selectedDayView.heightAnchor.constraint(equalToConstant: 120),
            
            selectedDayLabel.topAnchor.constraint(equalTo: selectedDayView.topAnchor, constant: 16),
            selectedDayLabel.leadingAnchor.constraint(equalTo: selectedDayView.leadingAnchor, constant: 16),
            
            timePicker.centerYAnchor.constraint(equalTo: selectedDayView.centerYAnchor),
            timePicker.centerXAnchor.constraint(equalTo: selectedDayView.centerXAnchor),
            
            doneButton.bottomAnchor.constraint(equalTo: selectedDayView.bottomAnchor, constant: -16),
            doneButton.trailingAnchor.constraint(equalTo: selectedDayView.trailingAnchor, constant: -16),
            
            selectedDaysStack.topAnchor.constraint(equalTo: selectedDayView.bottomAnchor, constant: 16),
            selectedDaysStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            selectedDaysStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            genderStack.topAnchor.constraint(equalTo: selectedDaysStack.bottomAnchor, constant: 24),
            genderStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            genderStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            genderStack.heightAnchor.constraint(equalToConstant: 50),
            
            shuttleImageView.topAnchor.constraint(equalTo: genderStack.bottomAnchor, constant: 24),
            shuttleImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            shuttleImageView.widthAnchor.constraint(equalToConstant: 60),
            shuttleImageView.heightAnchor.constraint(equalToConstant: 60),
            
            okButton.topAnchor.constraint(equalTo: shuttleImageView.bottomAnchor, constant: 24),
            okButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            okButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            okButton.heightAnchor.constraint(equalToConstant: 50),
            okButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    @objc private func weekdayButtonTapped(_ sender: UIButton) {
        guard let day = sender.title(for: .normal) else { return }
        
        weekdayButtons.forEach { button in
            button.backgroundColor = .systemGray6
            button.setTitleColor(.systemGray, for: .normal)
        }
        
        sender.backgroundColor = .systemBlue
        sender.setTitleColor(.white, for: .normal)
        
        selectedDayLabel.text = "Select time for \(day)"
        selectedDayView.isHidden = false
        timePicker.date = selectedDays[day] ?? Date()
    }
    
    @objc private func doneButtonTapped() {
        guard let selectedDay = selectedDayLabel.text?.components(separatedBy: "Select time for ").last,
              let selectedButton = weekdayButtons.first(where: { $0.title(for: .normal) == selectedDay }) else { return }
        
        selectedDays[selectedDay] = timePicker.date
        selectedDayView.isHidden = true
        updateSelectedDaysView()
    }
    
    @objc private func imagePickerButtonTapped() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    @objc private func genderButtonTapped(_ sender: UIButton) {
        maleButton.backgroundColor = sender == maleButton ? .systemBlue : .systemGray6
        femaleButton.backgroundColor = sender == femaleButton ? .systemBlue : .systemGray6
        maleButton.setTitleColor(sender == maleButton ? .white : .systemBlue, for: .normal)
        femaleButton.setTitleColor(sender == femaleButton ? .white : .systemBlue, for: .normal)
    }
    
    private func updateSelectedDaysView() {
        selectedDaysStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for (day, time) in selectedDays.sorted(by: { $0.key < $1.key }) {
            let container = UIView()
            container.backgroundColor = .systemGray6
            container.layer.cornerRadius = 10
            
            let dayLabel = UILabel()
            dayLabel.text = day
            dayLabel.font = .systemFont(ofSize: 16, weight: .medium)
            dayLabel.textColor = .label
            dayLabel.translatesAutoresizingMaskIntoConstraints = false
            
            let timeLabel = UILabel()
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:00"
            timeLabel.text = formatter.string(from: time)
            timeLabel.font = .systemFont(ofSize: 16)
            timeLabel.textColor = .systemGray
            timeLabel.translatesAutoresizingMaskIntoConstraints = false
            
            container.addSubview(dayLabel)
            container.addSubview(timeLabel)
            
            NSLayoutConstraint.activate([
                container.heightAnchor.constraint(equalToConstant: 44),
                
                dayLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
                dayLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor),
                
                timeLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
                timeLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor)
            ])
            
            selectedDaysStack.addArrangedSubview(container)
        }
    }
    
    @objc private func okButtonTapped() {
        guard let userData = userData else { return }
        
        // Format time without date components
        let availabilityString = selectedDays.map { day, time -> String in
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:00" // Only hour in 24-hour format
            return "\(day): \(formatter.string(from: time))"
        }.joined(separator: ", ")
        
        // Get base64 string of profile image
        let imageString: String
        if let image = profileImageView.image,
           let imageData = image.jpegData(compressionQuality: 0.5) {
            imageString = imageData.base64EncodedString()
            UserDefaults.standard.set(imageData, forKey: "userProfileImage")

        } else {
            imageString = ""
        }
        
        Task {
            do {
                try await SupabaseAuthanticationManager.shared.getClient().from("Player").insert([
                    "id": userData.id.uuidString,
                    "email": userData.email,
                    "name": userData.name,
                    "contactNumber": userData.contactNumber,
                    "playerImage": imageString,
                    "location": locationTextField.text ?? "",
                    "availableTime": availabilityString,
                    "gender": maleButton.backgroundColor == .systemBlue ? "Male" : "Female",
                    "skillLevel": "Beginner",
                    "elitePoint": "0"
                ]).execute()
                
                DispatchQueue.main.async { [weak self] in
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "main") as! MainTabBarController
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
            } catch {
                print("Error inserting user data: \(error)")
                // Show error alert
                DispatchQueue.main.async { [weak self] in
                    let alert = UIAlertController(title: "Error", message: "Failed to save data. Please try again.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self?.present(alert, animated: true)
                }
            }
        }
    }
}
