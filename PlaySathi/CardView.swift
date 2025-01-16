//
//  CardView.swift
//  PlaySathi
//
//  Created by Batch - 2 on 16/01/25.
//


import UIKit

class CardView: UIView {
    override init (frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    private func initialSetup() {
        layer.shadowColor = UIColor.black.cgColor
        layer.cornerRadius = 10
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.1
        
    }
}
