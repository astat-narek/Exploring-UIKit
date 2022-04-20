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
    
    private lazy var headerLabel: UILabel = {
        addHeader(withTitle: "Игроки за столом")
    }()
    
    private let playersStack = UIStackView()
    
    private let startGameButton = UIButton()
    
    init(viewModel: NewPlayViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPlayers()
        style()
        layout()
    }
}

extension NewPlayViewController {
    
    private func addPlayers() {
        var players = [UITextField]()
        let cards = randomCardsList()
        for i in 1...10 {
            let label = UILabel()
            let textField = UITextField()
            let hStack = UIStackView()
            
            
            label.text = String(i)
            label.font = Constants.Fonts.body
            label.textAlignment = .right
            label.textColor = .black
            label.widthAnchor.constraint(equalToConstant: 29).isActive = true
            
            

            textField.addPaddings()
            textField.font = Constants.Fonts.body
            textField.textColor = Constants.Colors.black
            let attributes = [NSAttributedString.Key.font: Constants.Fonts.body.withSize(15),
                              NSAttributedString.Key.foregroundColor: Constants.Colors.gray]
            textField.attributedPlaceholder = NSAttributedString(string: "Введите имя игрока", attributes: attributes)
            textField.backgroundColor = .white
            textField.layer.cornerRadius = 5
            textField.delegate = self
            textField.text = cards[i-1].role.rawValue
            
            hStack.addArrangedSubview(label)
            hStack.addArrangedSubview(textField)
            
            hStack.axis = .horizontal
            hStack.spacing = 10
            
            
            playersStack.addArrangedSubview(hStack)
            players.append(textField)
        }
    }
    
    
    private func style() {
        view.backgroundColor = Constants.Colors.gray
        
        // Close button
        closeButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: [])
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .primaryActionTriggered)
        closeButton.tintColor = Constants.Colors.black
        closeButton.imageView?.contentMode = .scaleAspectFit

        
        // Stack
        playersStack.axis = .vertical
        playersStack.spacing = 10
        playersStack.distribution = .fillEqually
        
        //Start New Game Button
        startGameButton.setTitle("Начать игру", for: [])
        startGameButton.addTarget(self, action: #selector(startNewGameButton), for: .primaryActionTriggered)
        startGameButton.backgroundColor = Constants.Colors.black
        startGameButton.setTitleColor(Constants.Colors.gray, for: [])
        startGameButton.layer.cornerRadius = 11
        startGameButton.titleLabel?.font = Constants.Fonts.button
    }
    
    private func layout() {
        view.addSubview(closeButton)
        view.addSubview(playersStack)
        view.addSubview(startGameButton)
        
        
        //Close Button
        closeButton.snp.makeConstraints { make in
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-8)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.width.equalTo(24)
            
        }
        
        //Players Stack
        playersStack.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-53)
            make.bottom.equalToSuperview().offset(-240)
        }
        
        //Start New Game Button
        startGameButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(85)
            make.right.equalToSuperview().offset(-85)
            make.bottom.equalToSuperview().offset(-53)
            make.height.equalTo(56)
        }
    }
    
    func randomCardsList() -> [Card]{
        var cards: [Card] = [donCard, sheriffCard] + Array(repeating: villagerCard, count: 6) + Array(repeating: mafiosiCard, count: 2)
        cards.shuffle()
        return cards
    }
}


extension NewPlayViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - Actions

extension NewPlayViewController {
    @objc func closeButtonTapped() {
        print("Close Button Tapped")
        viewModel.close()
    }
    
    @objc func startNewGameButton() {
        print("Start New Game Tapped")
        viewModel.openItem()
    }
    
}
