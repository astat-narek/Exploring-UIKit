//
//  ViewController.swift
//  Task 1
//
//  Created by Narek Danielyan on 01.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let rectView = gradientView(colors: [UIColor.red.cgColor,UIColor.blue.cgColor])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

extension ViewController {
    
    func style() {
        view.backgroundColor = .systemBackground
        
        rectView.translatesAutoresizingMaskIntoConstraints = false
        rectView.layer.cornerRadius = 20
        rectView.layer.shadowColor = UIColor.black.cgColor
        rectView.layer.shadowOpacity = 0.5
        rectView.layer.shadowOffset = .zero
        rectView.layer.shadowRadius = 10
        rectView.clipsToBounds = true
    }
    
    func layout() {
        view.addSubview(rectView)
        
        NSLayoutConstraint.activate([
            rectView.widthAnchor.constraint(equalToConstant: 100),
            rectView.heightAnchor.constraint(equalToConstant: 100),
            rectView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rectView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100)
        ])
    }
}


class gradientView: UIView {
    
    let gradient = CAGradientLayer()

    init(colors: [CGColor]){
        super.init(frame: .zero)
        gradient.frame = bounds
        gradient.colors = colors
        layer.addSublayer(gradient)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = bounds
    }
    
}
