//
//  UIViewController+extensions.swift
//  Mafia
//
//  Created by Narek Danielyan on 17.04.2022.
//

import Foundation
import UIKit


extension UIViewController {
    func addHeader(withTitle title: String) {
        let headerLabel = UILabel()
        
        headerLabel.text = title
        headerLabel.font = Constants.Fonts.header
        headerLabel.textAlignment = .center
        headerLabel.textColor = Constants.Colors.black
        
        view.addSubview(headerLabel)
        
        headerLabel.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide)
            make.right.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(96)
        }
    }
}
