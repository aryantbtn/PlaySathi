// Your imports
import UIKit
import PhotosUI
protocol UserPersonalViewControllerDelegate: AnyObject {
    func didUpdateUserProfile(userInfo: UserProfile)
}

struct UserProfile {
    let name: String
    let dob: String
    let age: String
    let email: String
    let phone: String
    let gender: String
    let address: String
    let gameType: String
    let profileImage: UIImage?
}

class UserPersonalViewController: UIViewController {
    // Add delegate property at the top of the class
     weak var delegate: UserPersonalViewControllerDelegate?
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    @objc private func saveButtonTapped() {
        // Basic validation
        guard let name = nameField.textField.text, !name.isEmpty,
              let dob = dobField.textField.text, !dob.isEmpty,
              let age = ageField.textField.text, !age.isEmpty,
              let email = emailField.textField.text, !email.isEmpty,
              let phone = phoneField.textField.text, !phone.isEmpty,
              let address = addressField.textField.text, !address.isEmpty else {
            
            let alert = UIAlertController(title: "Error", message: "Please fill in all fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        
        let genderOptions = ["Male", "Female", "Other"]
        let gameTypeOptions = ["Singles", "Doubles", "Both"]
        
        let userProfile = UserProfile(
            name: name,
            dob: dob,
            age: age,
            email: email,
            phone: phone,
            gender: genderOptions[genderSegment.selectedSegmentIndex],
            address: address,
            gameType: gameTypeOptions[gameTypeSegment.selectedSegmentIndex],
            profileImage: profileImageView.image
        )
        
        delegate?.didUpdateUserProfile(userInfo: userProfile)
        navigationController?.popViewController(animated: true)
    }
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemGray5
        imageView.image = UIImage(systemName: "person.circle.fill")
        imageView.tintColor = .systemGray2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private let editPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Edit Photo", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nameField = CustomTextField(title: "Full Name", placeholder: "Enter your name")
    private let dobField = CustomTextField(title: "Date of Birth", placeholder: "Select date")
    private let ageField = CustomTextField(title: "Age", placeholder: "Your age")
    private let emailField = CustomTextField(title: "Email", placeholder: "your.email@example.com")
    private let phoneField = CustomTextField(title: "Phone Number", placeholder: "+91 XXXXX-XXXXX")
    private let addressField = CustomTextField(title: "Address", placeholder: "Enter your address")
    
    private let genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Gender"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let genderSegment: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Male", "Female", "Other"])
        segment.selectedSegmentIndex = 0
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    private let gameTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Preferred Game Type"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let gameTypeSegment: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Singles", "Doubles", "Both"])
        segment.selectedSegmentIndex = 0
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    private let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
    }
    
    private func setupUI() {
        title = "Personal Information"
        view.backgroundColor = .systemBackground
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveButtonTapped))
        
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        [profileImageView, editPhotoButton, nameField, dobField, ageField, emailField, phoneField,
         genderLabel, genderSegment, addressField, gameTypeLabel, gameTypeSegment].forEach {
            containerView.addSubview($0)
        }
        
        setupConstraints()
        setupDatePicker()
    }
    
    private func setupDatePicker() {
        dobField.textField.inputView = datePicker
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(datePickerDone))
        toolbar.setItems([doneButton], animated: false)
        dobField.textField.inputAccessoryView = toolbar
    }
    
    private func setupConstraints() {
        let padding: CGFloat = 20
        let imageSize: CGFloat = 100
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            profileImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            profileImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: imageSize),
            profileImageView.heightAnchor.constraint(equalToConstant: imageSize),
            
            editPhotoButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8),
            editPhotoButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            nameField.topAnchor.constraint(equalTo: editPhotoButton.bottomAnchor, constant: padding),
            nameField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            nameField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            
            dobField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: padding),
            dobField.leadingAnchor.constraint(equalTo: nameField.leadingAnchor),
            dobField.trailingAnchor.constraint(equalTo: nameField.trailingAnchor),
            
            ageField.topAnchor.constraint(equalTo: dobField.bottomAnchor, constant: padding),
            ageField.leadingAnchor.constraint(equalTo: nameField.leadingAnchor),
            ageField.trailingAnchor.constraint(equalTo: nameField.trailingAnchor),
            
            emailField.topAnchor.constraint(equalTo: ageField.bottomAnchor, constant: padding),
            emailField.leadingAnchor.constraint(equalTo: nameField.leadingAnchor),
            emailField.trailingAnchor.constraint(equalTo: nameField.trailingAnchor),
            
            phoneField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: padding),
            phoneField.leadingAnchor.constraint(equalTo: nameField.leadingAnchor),
            phoneField.trailingAnchor.constraint(equalTo: nameField.trailingAnchor),
            
            genderLabel.topAnchor.constraint(equalTo: phoneField.bottomAnchor, constant: padding),
            genderLabel.leadingAnchor.constraint(equalTo: nameField.leadingAnchor),
            
            genderSegment.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 8),
            genderSegment.leadingAnchor.constraint(equalTo: nameField.leadingAnchor),
            genderSegment.trailingAnchor.constraint(equalTo: nameField.trailingAnchor),
            
            addressField.topAnchor.constraint(equalTo: genderSegment.bottomAnchor, constant: padding),
            addressField.leadingAnchor.constraint(equalTo: nameField.leadingAnchor),
            addressField.trailingAnchor.constraint(equalTo: nameField.trailingAnchor),
            
            gameTypeLabel.topAnchor.constraint(equalTo: addressField.bottomAnchor, constant: padding),
            gameTypeLabel.leadingAnchor.constraint(equalTo: nameField.leadingAnchor),
            
            gameTypeSegment.topAnchor.constraint(equalTo: gameTypeLabel.bottomAnchor, constant: 8),
            gameTypeSegment.leadingAnchor.constraint(equalTo: nameField.leadingAnchor),
            gameTypeSegment.trailingAnchor.constraint(equalTo: nameField.trailingAnchor),
            gameTypeSegment.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding)
        ])
        
        profileImageView.layer.cornerRadius = imageSize / 2
    }
    
    private func setupActions() {
        profileImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(profileImageTapped)))
        editPhotoButton.addTarget(self, action: #selector(profileImageTapped), for: .touchUpInside)
    }
    
    @objc private func profileImageTapped() {
        var config = PHPickerConfiguration()
        config.selectionLimit = 1
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        present(picker, animated: true)
    }
    
   
    
    @objc private func datePickerDone() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        dobField.textField.text = formatter.string(from: datePicker.date)
        view.endEditing(true)
    }
}

extension UserPersonalViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        guard let result = results.first else { return }
        result.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
            if let image = image as? UIImage {
                DispatchQueue.main.async {
                    self?.profileImageView.image = image
                }
            }
        }
    }
}

class CustomTextField: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textField: UITextField = {
        let field = UITextField()
        field.borderStyle = .roundedRect
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    init(title: String, placeholder: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        textField.placeholder = placeholder
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        addSubview(textField)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
            textField.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
}

// End of file. No additional code.
