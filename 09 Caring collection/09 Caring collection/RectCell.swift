//
//  RectCell.swift
//  09 Caring collection
//
//  Created by Narek Danielyan on 26.03.2023.
//

import UIKit

class RectCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: RectCell.self)
    
    override init(frame: CGRect) {
            super.init(frame: frame)

            setupViews()
            layoutViews()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .systemGray
        layer.cornerRadius = 20
    }
    
    private func layoutViews() {
        
    }
    
}
