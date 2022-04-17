//
//  NewPlayViewController.swift
//  Mafia
//
//  Created by Narek Danielyan on 17.04.2022.
//

import Foundation
import UIKit

class NewPlayViewController: UIViewController {
    
    private let viewModel: NewPlayViewModel
    
    private let closeButton = UIButton()
    
    init(viewModel: NewPlayViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addHeader(withTitle: "Игроки за столом")
    
        style()
        layout()
    }
}

extension NewPlayViewController {
    
    func style() {
        view.backgroundColor = Constants.Colors.gray
        
        // Close button
        closeButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: [])
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .primaryActionTriggered)
        closeButton.tintColor = Constants.Colors.black
    }
    
    func layout() {
        view.addSubview(closeButton)
        
        
        //Close Button
        closeButton.snp.makeConstraints { make in
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-8)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(24)
        }
    }
}


// MARK: - Actions

extension NewPlayViewController {
    @objc func closeButtonTapped() {
        print("Close Button Tapped()")
        viewModel.close()
    }
    
}

