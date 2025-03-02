import UIKit
import FSCalendar

class HistoryViewController: UIViewController {
    
    private let calendar: FSCalendar = {
        let calendar = FSCalendar()
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.scrollDirection = .horizontal
        
      
        calendar.appearance.titleDefaultColor = .black
        calendar.appearance.headerTitleColor = .black
        calendar.appearance.weekdayTextColor = .darkGray
        calendar.appearance.todayColor = .clear
        calendar.appearance.titleTodayColor = .systemGreen
        calendar.appearance.selectionColor = .systemGreen
        
       
        calendar.appearance.weekdayFont = .systemFont(ofSize: 13, weight: .regular)
        calendar.appearance.titleFont = .systemFont(ofSize: 15, weight: .regular)
        
        calendar.appearance.borderRadius = 0
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        calendar.headerHeight = 0
        calendar.appearance.borderSelectionColor = .clear
        calendar.appearance.eventDefaultColor = .clear
        calendar.appearance.eventSelectionColor = .clear
        
      
        calendar.rowHeight = 40
        calendar.weekdayHeight = 30
        
       
        calendar.appearance.titleOffset = CGPoint(x: 0, y: 0)
        calendar.placeholderType = .none
        
       
        calendar.backgroundColor = .white
        calendar.clipsToBounds = true
        calendar.scrollEnabled = true
        calendar.scope = .week
        
     
        calendar.layer.borderWidth = 0
        calendar.layer.cornerRadius = 0
        
        return calendar
    }()
    
    private let selectedDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let matchesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupCalendar()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
       
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        view.addSubview(calendar)
        view.addSubview(selectedDateLabel)
        view.addSubview(matchesTableView)
        
        NSLayoutConstraint.activate([
           
            calendar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            calendar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            calendar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            calendar.heightAnchor.constraint(equalToConstant: 85),
            
           
            selectedDateLabel.topAnchor.constraint(equalTo: calendar.bottomAnchor, constant: 32),
            selectedDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            selectedDateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            matchesTableView.topAnchor.constraint(equalTo: selectedDateLabel.bottomAnchor, constant: 16),
            matchesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            matchesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            matchesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
       
        calendar.calendarWeekdayView.weekdayLabels.forEach { label in
            label.font = .systemFont(ofSize: 13)
            label.textColor = .darkGray
   
            label.textAlignment = .center
        }
    }
    
    private func setupCalendar() {
        calendar.delegate = self
        calendar.dataSource = self
        calendar.select(Date())
        updateSelectedDateLabel(Date())
        

        calendar.setCurrentPage(Date(), animated: false)
    }
    
    private func updateSelectedDateLabel(_ date: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE — dd MMM yyyy"
        selectedDateLabel.text = formatter.string(from: date)
    }
}

extension HistoryViewController: FSCalendarDelegate, FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        updateSelectedDateLabel(date)
        
        if monthPosition == .previous || monthPosition == .next {
            calendar.setCurrentPage(date, animated: true)
        }
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        if calendar.gregorian.isDateInToday(date) {
            return .systemGreen
        }
        return nil
    }
    
   
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillSelectionColorFor date: Date) -> UIColor? {
        return .systemGreen.withAlphaComponent(0.3)
    }
}


