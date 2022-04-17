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
    private let playersStack = UIStackView()
    
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
        addPlayers()
        style()
        layout()
    }
}

extension NewPlayViewController {
    
    
    private func addPlayers() {
        var players = [UITextField]()
        
        for i in 1...10 {
            let label = UILabel()
            let textField = UITextField()
            let hStack = UIStackView()
            
            
            label.text = String(i)
            label.font = Constants.Fonts.body
            label.textAlignment = .right
            label.textColor = .black
            label.widthAnchor.constraint(equalToConstant: 29).isActive = true
            
            
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
            textField.leftView = paddingView
            textField.leftViewMode = UITextField.ViewMode.always
            textField.font = Constants.Fonts.body
            textField.textColor = Constants.Colors.black
            let attributes = [NSAttributedString.Key.font: Constants.Fonts.body.withSize(15),
                              NSAttributedString.Key.foregroundColor: Constants.Colors.gray]
            textField.attributedPlaceholder = NSAttributedString(string: "Введите имя игрока", attributes: attributes)
            textField.backgroundColor = .white
            textField.layer.cornerRadius = 5
            textField.bounds.inset(by: UIEdgeInsets(top: 2, left: 10, bottom: 2, right: 2))
            textField.delegate = self
            
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
        
        // Stack
        playersStack.axis = .vertical
        playersStack.spacing = 10
        playersStack.distribution = .fillEqually
    }
    
    private func layout() {
        view.addSubview(closeButton)
        view.addSubview(playersStack)
        
        
        //Close Button
        closeButton.snp.makeConstraints { make in
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-8)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(24)
        }
        
        //Players Stack
        playersStack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(140)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-53)
            make.bottom.equalToSuperview().offset(-240)
        }
    }
}


// MARK: - Actions

extension NewPlayViewController {
    @objc func closeButtonTapped() {
        print("Close Button Tapped")
        viewModel.close()
    }
    
}

extension NewPlayViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
