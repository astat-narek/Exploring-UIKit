//
//  CardView.swift
//  Mafia
//
//  Created by Narek Danielyan on 18.04.2022.
//

import Foundation
import UIKit


class CardView: UIView {
    
    let alias = "Ник"
    
    let card: Card
    
    private let aliasLabel =  UILabel()
    private let roleImageView = UIImageView()
    private let roleLabel = UILabel()
    
    
    init(for card: Card) {
        self.card = card
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 340, height: 560)
    }
}

extension CardView {
    
    func style() {
        backgroundColor = card.cardColor
        layer.cornerRadius = 20
        layer.masksToBounds = true
        
        aliasLabel.text = alias
        aliasLabel.font = Constants.Fonts.cardHeader
        aliasLabel.textAlignment = .center
        aliasLabel.textColor = card.fontColor
        
        roleImageView.image = card.roleImage
        roleImageView.tintColor = Constants.Colors.black
        roleImageView.contentMode = .scaleAspectFit
        
        roleLabel.text = card.role.rawValue
        roleLabel.font = Constants.Fonts.cardHeader
        roleLabel.textAlignment = .center
        roleLabel.textColor = card.fontColor
    }
    
    func layout() {
        addSubview(aliasLabel)
        addSubview(roleLabel)
        addSubview(roleImageView)
        
        aliasLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(44)
            make.leading.trailing.equalToSuperview()
        }
        
        roleImageView.snp.makeConstraints { make in
            make.height.equalTo(250)
            make.center.equalToSuperview()

        }
        
        roleLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-44)
            make.leading.trailing.equalToSuperview()
        }
        
    }
}
