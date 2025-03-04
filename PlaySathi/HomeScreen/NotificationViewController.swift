//
//  NotificationViewController.swift
//  PlaySathi
//
//  Created by ARYAN SINGHAL on 04/03/25.
//

import UIKit


class NotificationViewController: UIViewController {
    // Add notification label
    private let notificationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup notification label
        view.addSubview(notificationLabel)
        NSLayoutConstraint.activate([
            notificationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            notificationLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            notificationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            notificationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    // Add method to show notification
    func showNotification(message: String) {
        notificationLabel.text = message
    }
}

