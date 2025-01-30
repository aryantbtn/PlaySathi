//
//  SectionHeaderCollectionReusableView.swift
//  PlaySathi
//
//  Created by Batch - 2 on 16/01/25.
//

import UIKit

class SectionHeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = String(describing: SectionHeaderCollectionReusableView.self)
    
    var headerLabel = UILabel()
    var button  = UIButton(type: .system)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateSectionHeader()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateSectionHeader()
    }
    
    
    func updateSectionHeader (){
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        headerLabel.font = .preferredFont(forTextStyle: .title3)
        
        addSubview(headerLabel)
        addSubview(button)
        
        NSLayoutConstraint.activate([
        headerLabel.topAnchor.constraint(equalTo: topAnchor),
        headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
        headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        
        button.topAnchor.constraint(equalTo: topAnchor),
        button.bottomAnchor.constraint(equalTo: bottomAnchor),
        button.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 300),
        button.trailingAnchor.constraint(equalTo: trailingAnchor),
        
        ])
    }
}
