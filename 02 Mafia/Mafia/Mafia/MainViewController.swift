//
//  ViewController.swift
//  Mafia
//
//  Created by Narek Danielyan on 17.04.2022.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    let clubNameLabel = UILabel()
    let logoImage = UIImageView()
    let clubStack = UIStackView()
    let newPartyButton = UIButton(type: .custom)
    let editClubNameButton = UIButton()
    
    private let viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

extension MainViewController {
    
    func style() {
        view.backgroundColor = Constants.Colors.black
        
        clubNameLabel.text = "Название клуба"
        clubNameLabel.font = Constants.Fonts.header
        clubNameLabel.textAlignment = .center
        clubNameLabel.textColor = .white
        
        
        editClubNameButton.setImage(UIImage(systemName: "pencil"), for: [])
        editClubNameButton.tintColor = Constants.Colors.gray
        
        logoImage.image = Constants.Image.villager
        logoImage.contentMode = .scaleAspectFit
        
        newPartyButton.setTitle("Новая серия", for: [])
        newPartyButton.addTarget(self, action: #selector(buttonTapped), for: .primaryActionTriggered)
        newPartyButton.backgroundColor = Constants.Colors.gray
        newPartyButton.setTitleColor(Constants.Colors.black, for: [])
        newPartyButton.layer.cornerRadius = 11
        newPartyButton.titleLabel?.font = Constants.Fonts.button
        
    }
    
    func layout() {
        
        clubStack.addSubview(clubNameLabel)
        clubStack.addSubview(editClubNameButton)
        view.addSubview(clubStack)
        view.addSubview(logoImage)
        view.addSubview(newPartyButton)
        
        clubStack.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide)
            make.right.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(96)
        }
        
        clubNameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(clubStack.snp.centerX)
        }
        
        editClubNameButton.snp.makeConstraints { make in
            make.leading.equalTo(clubNameLabel.snp.trailing).offset(8)
            make.centerY.equalTo(clubNameLabel.snp.centerY)
        }
        
        
        logoImage.snp.makeConstraints { make in
            make.center.equalTo(view.snp.center)
            make.width.equalTo(208)
        }
        
        newPartyButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(85)
            make.right.equalToSuperview().offset(-85)
            make.bottom.equalToSuperview().offset(-53)
            make.height.equalTo(56)
        }
        
        
        
        
        
    }
}

extension MainViewController {
    @objc func buttonTapped(sender: UIButton){
        print("button tapped")
        viewModel.openItem()

    }
}
