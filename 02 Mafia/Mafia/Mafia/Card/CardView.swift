//
//  CardView.swift
//  Mafia
//
//  Created by Narek Danielyan on 18.04.2022.
//

import Foundation
import UIKit


class CardView: UIView {
    
    let alias = "Никнейм"
    let roleImage: UIImage = Constants.Image.sheriff ?? UIImage()
    let role = "Шериф"
    let cardColor = Constants.Colors.yellow
    let fontColor: UIColor = .black
    
    private let aliasLabel =  UILabel()
    private let roleImageView = UIImageView()
    private let roleLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
        backgroundColor = Constants.Colors.yellow
        layer.cornerRadius = 20
        
        aliasLabel.text = alias
        aliasLabel.font = Constants.Fonts.cardHeader
        aliasLabel.textAlignment = .center
        aliasLabel.textColor = fontColor
        
        roleImageView.image = roleImage
        roleImageView.tintColor = .black
        roleImageView.contentMode = .scaleAspectFit
        
        roleLabel.text = role
        roleLabel.font = Constants.Fonts.cardHeader
        roleLabel.textAlignment = .center
        roleLabel.textColor = fontColor
    }
    
    func layout() {
        addSubview(aliasLabel)
        addSubview(roleImageView)
        addSubview(roleLabel)
        
        aliasLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(44)
            make.leading.trailing.equalToSuperview()
        }
        
        roleImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(173)
        }
        
        roleLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-44)
            make.leading.trailing.equalToSuperview()
        }
        
    }
}
