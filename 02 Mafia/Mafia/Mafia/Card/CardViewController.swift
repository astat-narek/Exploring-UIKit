//
//  CardViewController.swift
//  Mafia
//
//  Created by Narek Danielyan on 18.04.2022.
//

import Foundation
import UIKit

class CardViewController: UIViewController {
    
    private let viewModel: CardViewModel
    
    private let closeButton = UIButton()
    private var headerLabel = UILabel()
    private let cardView: CardView = CardView(for: donCard)
    
    init(viewModel: CardViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel = addHeader(withTitle: "Игрок #1")
        style()
        layout()
        print(viewModel.card)
    }
}

extension CardViewController {
    
    func style() {
        view.backgroundColor = Constants.Colors.gray
        
        // Close button
        closeButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: [])
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .primaryActionTriggered)
        closeButton.tintColor = Constants.Colors.black
        closeButton.imageView?.contentMode = .scaleAspectFit
    }
    
    func layout() {
        view.addSubview(closeButton)
        view.addSubview(cardView)
        //Close Button
        closeButton.snp.makeConstraints { make in
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-8)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.width.equalTo(24)
            
        }
        
        cardView.snp.makeConstraints { make in
            make.top.equalTo(145)
            make.bottom.equalTo(-145)
            make.leading.equalTo(25)
            make.trailing.equalTo(-25)
            
        }
        
    }

}


// MARK: - Actions


extension CardViewController {
    @objc func closeButtonTapped() {
        print("Close Button Tapped")
        viewModel.close()
    }
}
