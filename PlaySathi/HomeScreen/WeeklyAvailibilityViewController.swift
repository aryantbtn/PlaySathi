import UIKit

class WeeklyAvailabilityViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    
    @IBOutlet weak var lo: UITextField!
    
    @IBOutlet weak var ti: UITextField!
    
    @IBOutlet weak var imm: UITextField!
    
    
    
    @IBAction func ok(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "main") as! MainTabBarController
            self.navigationController?.pushViewController(vc, animated: true)
    }
    
    

}

//    // MARK: - UI Components
//    private let scrollView: UIScrollView = {
//        let scroll = UIScrollView()
//        scroll.translatesAutoresizingMaskIntoConstraints = false
//        return scroll
//    }()
//    
//    private let contentView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//    
//    private let profileImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        imageView.backgroundColor = .systemGray5
//        imageView.layer.cornerRadius = 50
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//    
//    private let imagePickerButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Add Photo", for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//    
//    private let locationTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Enter your location"
//        textField.borderStyle = .roundedRect
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//    }()
//    
//    private let distanceStack: UIStackView = {
//        let stack = UIStackView()
//        stack.axis = .vertical
//        stack.spacing = 8
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        return stack
//    }()
//    
//    private let distanceSlider: UISlider = {
//        let slider = UISlider()
//        slider.minimumValue = 1
//        slider.maximumValue = 50
//        slider.value = 10
//        slider.translatesAutoresizingMaskIntoConstraints = false
//        return slider
//    }()
//    
//    private let distanceLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Maximum Distance: 10 km"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    private let availabilityStackView: UIStackView = {
//        let stack = UIStackView()
//        stack.axis = .vertical
//        stack.spacing = 16
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        return stack
//    }()
//    
//    private let saveButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Save", for: .normal)
//        button.backgroundColor = .systemBlue
//        button.setTitleColor(.white, for: .normal)
//        button.layer.cornerRadius = 10
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//    
//    private let daysOfWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
//    private var dayViews: [DayAvailabilityView] = []
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupUI()
//        setupActions()
//    }
//    
//    private func setupUI() {
//        view.backgroundColor = .white
//        
//        view.addSubview(scrollView)
//        scrollView.addSubview(contentView)
//        
//        contentView.addSubview(profileImageView)
//        contentView.addSubview(imagePickerButton)
//        contentView.addSubview(locationTextField)
//        contentView.addSubview(distanceStack)
//        contentView.addSubview(availabilityStackView)
//        contentView.addSubview(saveButton)
//        
//        distanceStack.addArrangedSubview(distanceLabel)
//        distanceStack.addArrangedSubview(distanceSlider)
//        
//        setupDayViews()
//        setupConstraints()
//    }
//    
//    private func setupDayViews() {
//        for day in daysOfWeek {
//            let dayView = DayAvailabilityView()
//            dayView.configure(with: day)
//            availabilityStackView.addArrangedSubview(dayView)
//            dayViews.append(dayView)
//        }
//    }
//    
//    private func setupConstraints() {
//        NSLayoutConstraint.activate([
//            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            
//            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
//            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
//            
//            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
//            profileImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            profileImageView.widthAnchor.constraint(equalToConstant: 100),
//            profileImageView.heightAnchor.constraint(equalToConstant: 100),
//            
//            imagePickerButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8),
//            imagePickerButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            
//            locationTextField.topAnchor.constraint(equalTo: imagePickerButton.bottomAnchor, constant: 20),
//            locationTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            locationTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            
//            distanceStack.topAnchor.constraint(equalTo: locationTextField.bottomAnchor, constant: 20),
//            distanceStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            distanceStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            
//            availabilityStackView.topAnchor.constraint(equalTo: distanceStack.bottomAnchor, constant: 20),
//            availabilityStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            availabilityStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            
//            saveButton.topAnchor.constraint(equalTo: availabilityStackView.bottomAnchor, constant: 20),
//            saveButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            saveButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            saveButton.heightAnchor.constraint(equalToConstant: 50),
//            saveButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
//        ])
//    }
//    
//    private func setupActions() {
//        imagePickerButton.addTarget(self, action: #selector(imagePickerButtonTapped), for: .touchUpInside)
//        distanceSlider.addTarget(self, action: #selector(distanceSliderChanged), for: .valueChanged)
//        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
//    }
//    
//    @objc private func imagePickerButtonTapped() {
//        let imagePicker = UIImagePickerController()
//        imagePicker.delegate = self
//        imagePicker.sourceType = .photoLibrary
//        present(imagePicker, animated: true)
//    }
//    
//    @objc private func distanceSliderChanged() {
//        distanceLabel.text = "Maximum Distance: \(Int(distanceSlider.value)) km"
//    }
//    
//    @objc private func saveButtonTapped() {
//        guard let location = locationTextField.text, !location.isEmpty else {
//            // Show alert for missing location
//            return
//        }
//        
//        // Save data and navigate
//        performSegue(withIdentifier: "home", sender: self)
//    }
//    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let image = info[.originalImage] as? UIImage {
//            profileImageView.image = image
//        }
//        picker.dismiss(animated: true)
//    }
//}
//
//class DayAvailabilityView: UIView {
//    private let dayLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    private let enableSwitch: UISwitch = {
//        let switch_ = UISwitch()
//        switch_.translatesAutoresizingMaskIntoConstraints = false
//        return switch_
//    }()
//    
//    private let timeStack: UIStackView = {
//        let stack = UIStackView()
//        stack.axis = .horizontal
//        stack.spacing = 16
//        stack.distribution = .fillEqually
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        return stack
//    }()
//    
//    private let startStack: UIStackView = {
//        let stack = UIStackView()
//        stack.axis = .vertical
//        stack.spacing = 4
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        return stack
//    }()
//    
//    private let endStack: UIStackView = {
//        let stack = UIStackView()
//        stack.axis = .vertical
//        stack.spacing = 4
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        return stack
//    }()
//    
//    private let startTimeLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Start"
//        label.font = .systemFont(ofSize: 14)
//        label.textColor = .systemGray
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    private let endTimeLabel: UILabel = {
//        let label = UILabel()
//        label.text = "End"
//        label.font = .systemFont(ofSize: 14)
//        label.textColor = .systemGray
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    let startTimePicker: UIDatePicker = {
//        let picker = UIDatePicker()
//        picker.datePickerMode = .time
//        picker.minuteInterval = 60
//        picker.translatesAutoresizingMaskIntoConstraints = false
//        return picker
//    }()
//    
//    let endTimePicker: UIDatePicker = {
//        let picker = UIDatePicker()
//        picker.datePickerMode = .time
//        picker.minuteInterval = 60
//        picker.translatesAutoresizingMaskIntoConstraints = false
//        return picker
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupUI()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setupUI() {
//        addSubview(dayLabel)
//        addSubview(enableSwitch)
//        addSubview(timeStack)
//        
//        startStack.addArrangedSubview(startTimeLabel)
//        startStack.addArrangedSubview(startTimePicker)
//        
//        endStack.addArrangedSubview(endTimeLabel)
//        endStack.addArrangedSubview(endTimePicker)
//        
//        timeStack.addArrangedSubview(startStack)
//        timeStack.addArrangedSubview(endStack)
//        
//        // Disable time pickers initially
//        startTimePicker.isEnabled = false
//        endTimePicker.isEnabled = false
//        
//        enableSwitch.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
//        
//        NSLayoutConstraint.activate([
//            dayLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
//            dayLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
//            dayLabel.widthAnchor.constraint(equalToConstant: 100),
//            
//            enableSwitch.leadingAnchor.constraint(equalTo: dayLabel.trailingAnchor, constant: 8),
//            enableSwitch.centerYAnchor.constraint(equalTo: centerYAnchor),
//            
//            timeStack.leadingAnchor.constraint(equalTo: enableSwitch.trailingAnchor, constant: 16),
//            timeStack.trailingAnchor.constraint(equalTo: trailingAnchor),
//            timeStack.centerYAnchor.constraint(equalTo: centerYAnchor),
//            
//            heightAnchor.constraint(equalToConstant: 80)
//        ])
//    }
//    
//    @objc private func switchValueChanged() {
//        startTimePicker.isEnabled = enableSwitch.isOn
//        endTimePicker.isEnabled = enableSwitch.isOn
//        startTimeLabel.textColor = enableSwitch.isOn ? .label : .systemGray
//        endTimeLabel.textColor = enableSwitch.isOn ? .label : .systemGray
//    }
//    
//    func configure(with day: String, isEnabled: Bool = false) {
//        dayLabel.text = day
//        enableSwitch.isOn = isEnabled
//        switchValueChanged()
//    }
//}

