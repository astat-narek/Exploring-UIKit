//
//  NumberCell.swift
//  Collection View 01
//
//  Created by Narek Danielyan on 26.03.2023.
//

import UIKit

class NumberCell: UICollectionViewCell {
    
    let label = UILabel()
    
    static let reuseIdentifier = String(describing: NumberCell.self)
    
    override init(frame: CGRect) {
            super.init(frame: frame)

            setupViews()
            layoutViews()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        label.textAlignment = .center
        backgroundColor = .systemCyan
    }
    
    private func layoutViews() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
