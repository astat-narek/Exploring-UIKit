//
//  ViewController.swift
//  Task 5
//
//  Created by Narek Danielyan on 13.03.2023.
//

import UIKit


class ViewController: UIViewController {
    
    let button: UIButton = UIButton(configuration: .plain())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupView()
        layoutView()
    }
    
    
    private func setupView() {
        button.setTitle("Present", for: .normal)
        button.addTarget(self, action: #selector(presentAction), for: .primaryActionTriggered)
    }
    
    
    private func layoutView() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    
    @objc func presentAction() {
        
        
        let navigationController = PopoverNavigationController(root: ChildController(), size: .init(width: 300, height: 280), sourceView: self.button, sourceRect: self.button.bounds, direction: .up)
        self.present(navigationController,animated: true)
    }
    
    
    
}




