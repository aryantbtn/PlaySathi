//
//  SlotViewController.swift
//  PlaySathi
//
//  Created by Batch - 2 on 22/01/25.
//

import UIKit

class SlotViewController: UIViewController {

        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Create a vertical stack view
//            let verticalStackView = UIStackView()
//            verticalStackView.axis = .vertical
//            verticalStackView.alignment = .fill
//            verticalStackView.distribution = .fillEqually
//            verticalStackView.spacing = 10
//            verticalStackView.translatesAutoresizingMaskIntoConstraints = false
//            
//            // Create 4 horizontal stack views
//            for j in 0..<4 {
//                let horizontalStackView = UIStackView()
//                horizontalStackView.axis = .horizontal
//                horizontalStackView.alignment = .fill
//                horizontalStackView.distribution = .fillEqually
//                horizontalStackView.spacing = 10
//                
//                // Add 4 labels to each horizontal stack
//                for i in 0..<4 {
//                    let label = UILabel()
//                    if i == 0 && j == 0 {
//                        label.text = "Slots"
//                    } else if j == 0  {
//                        label.text = "C \(i)"
//                    } else if i == 0 {
//                        label.text = "Time"
//                    } else {
//                        label.text = "Rs 300"
//                    }
//                    label.textAlignment = .center
//                    label.backgroundColor = .lightGray
//                    label.layer.borderColor = UIColor.darkGray.cgColor
//                    label.layer.borderWidth = 1
//                    horizontalStackView.addArrangedSubview(label)
//                }
//                
//                // Add the horizontal stack to the vertical stack
//                verticalStackView.addArrangedSubview(horizontalStackView)
//            }
//            
//            // Add the vertical stack view to the main view
//            view.addSubview(verticalStackView)
//            
//            // Set constraints for vertical stack view
//            NSLayoutConstraint.activate([
//                verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//                verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//                verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//            ])
//            
        }
    
    
    @IBAction func goToPaymentGateway(_ sender: UIButton) {
        performSegue(withIdentifier: "paymentGateway", sender: nil)
        
    }
}


