//
//  WeeklyAvailibilityViewController.swift
//  PlaySathi
//
//  Created by ARYAN SINGHAL on 27/02/25.
//

import UIKit

class WeeklyAvailabilityViewController: UIViewController {
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Set Your Weekly Availability"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let availabilityTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .singleLine
        table.layer.cornerRadius = 8
        table.layer.borderWidth = 1
        table.layer.borderColor = UIColor.systemGray4.cgColor
        return table
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save Availability", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let daysOfWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    private var selectedDays: [Int: (startTime: Date, endTime: Date)] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        view.addSubview(containerView)
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(availabilityTable)
        containerView.addSubview(saveButton)
        
        setupConstraints()
        
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    private func setupTableView() {
        availabilityTable.delegate = self
        availabilityTable.dataSource = self
        availabilityTable.register(AvailabilityTableViewCell.self, forCellReuseIdentifier: "AvailabilityCell")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            availabilityTable.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            availabilityTable.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            availabilityTable.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            availabilityTable.heightAnchor.constraint(equalToConstant: 350),
            
            saveButton.topAnchor.constraint(equalTo: availabilityTable.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            saveButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
        ])
    }
    
    @objc private func saveButtonTapped() {
        // Save the availability data here
        performSegue(withIdentifier: "home", sender: self)


    }
}

extension WeeklyAvailabilityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daysOfWeek.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AvailabilityCell", for: indexPath) as! AvailabilityTableViewCell
        cell.configure(dayName: daysOfWeek[indexPath.row])
        
        if let timeSlot = selectedDays[indexPath.row] {
            cell.startTimePicker.date = timeSlot.startTime
            cell.endTimePicker.date = timeSlot.endTime
        }
        
        cell.timeChanged = { [weak self] start, end in
            self?.selectedDays[indexPath.row] = (start, end)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

class AvailabilityTableViewCell: UITableViewCell {
    private let dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let startTimePicker: UIDatePicker = {
            let picker = UIDatePicker()
            picker.datePickerMode = .time
            picker.minuteInterval = 60 // This makes minutes non-scrollable
            // Set initial date to start of hour
            let calendar = Calendar.current
            let date = calendar.date(bySettingHour: 9, minute: 0, second: 0, of: Date()) ?? Date()
            picker.date = date
            picker.translatesAutoresizingMaskIntoConstraints = false
            return picker
        }()
        
        let endTimePicker: UIDatePicker = {
            let picker = UIDatePicker()
            picker.datePickerMode = .time
            picker.minuteInterval = 60 // This makes minutes non-scrollable
            // Set initial date to start of hour
            let calendar = Calendar.current
            let date = calendar.date(bySettingHour: 17, minute: 0, second: 0, of: Date()) ?? Date()
            picker.date = date
            picker.translatesAutoresizingMaskIntoConstraints = false
            return picker
        }()
    
    var timeChanged: ((Date, Date) -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(dayLabel)
        contentView.addSubview(startTimePicker)
        contentView.addSubview(endTimePicker)
        
        NSLayoutConstraint.activate([
            dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dayLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            dayLabel.widthAnchor.constraint(equalToConstant: 100),
            
            startTimePicker.leadingAnchor.constraint(equalTo: dayLabel.trailingAnchor, constant: 0),
            startTimePicker.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            endTimePicker.leadingAnchor.constraint(equalTo: startTimePicker.trailingAnchor, constant: 8),
            endTimePicker.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            endTimePicker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:-8)
        ])
        
        startTimePicker.addTarget(self, action: #selector(timePickerChanged), for: .valueChanged)
        endTimePicker.addTarget(self, action: #selector(timePickerChanged), for: .valueChanged)
    }
    
    func configure(dayName: String) {
        dayLabel.text = dayName
    }
    
    @objc private func timePickerChanged() {
        timeChanged?(startTimePicker.date, endTimePicker.date)
    }
}

