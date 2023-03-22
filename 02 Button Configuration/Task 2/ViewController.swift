//
//  ViewController.swift
//  Task 2
//
//  Created by Narek Danielyan on 05.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let stackView = UIStackView()
    let firstButton = BlueButton(title: "First Button")
    let secondButton = BlueButton(title: "Second Medium Button")
    let thirdButton = BlueButton(title: "Third")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        style()
        layout()
    }
}

extension ViewController {
    
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.sizeToFit()
        
        thirdButton.addTarget(self, action: #selector(thirdButtonTapped), for: .primaryActionTriggered)
    }
    
    func layout() {
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        stackView.addArrangedSubview(thirdButton)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

extension ViewController {
    
    @objc func thirdButtonTapped(sender: UIButton){
        self.present(NewVC(), animated: true)
    }
}


class BlueButton: UIButton {

    override var isHighlighted: Bool {
        didSet {
            UIView.animate (withDuration: 0.15, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options:
                                [.beginFromCurrentState, .allowUserInteraction]) {
                self.transform = self.isHighlighted ? .init(scaleX: 0.94, y: 0.94) : .identity
            }
        }
    }
    
    
    init(title: String? = "Button Title") {
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        layer.cornerRadius = 8
        
        var config = UIButton.Configuration.filled()
        config.image = UIImage(systemName: "arrow.forward.circle.fill")
        config.imagePlacement = .trailing
        config.imagePadding = 8
        config.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 14,
            bottom: 10,
            trailing: 14
        )
        configuration = config
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func tintColorDidChange() {
        
        if self.tintAdjustmentMode == .dimmed {
            self.backgroundColor = .lightGray
        }
        
        super.tintColorDidChange()
    }
}





//let handler: UIButton.ConfigurationUpdateHandler = { button in
//            switch button.state {
//            case .normal:
//                buttonAnimateToOrigin()
//            case .highlighted:
//                buttonAnimateToSmaller()
//            default:
//                buttonAnimateToOrigin()
//            }
//        }
//
//
//        configurationUpdateHandler = handler
