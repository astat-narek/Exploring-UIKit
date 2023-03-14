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
    
    init(title: String? = "Button Title") {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setup()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func tintColorDidChange() {
        
        if self.tintAdjustmentMode == .dimmed {
            self.backgroundColor = .gray
        }
        
        super.tintColorDidChange()
    }
    
    
    func setup() {
        
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
        
        let handler: UIButton.ConfigurationUpdateHandler = { button in
            switch button.state {
            case .normal:
                buttonAnimateToOrigin()
            case .highlighted:
                buttonAnimateToSmaller()
            default:
                buttonAnimateToOrigin()
            }
        }
        
        
        configurationUpdateHandler = handler
        configuration = config
        
        func buttonAnimateToSmaller() {
            UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction],
                           animations: {
                self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            })
        }
        
        func buttonAnimateToOrigin() {
            UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction],
                           animations: {
                self.transform = CGAffineTransform.identity
            })
        }
    }
}

