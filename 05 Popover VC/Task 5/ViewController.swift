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
        
        let popoverVC = PopoverViewController()
            popoverVC.modalPresentationStyle = .popover
            popoverVC.preferredContentSize = CGSize(width: 300, height: 280)
            popoverVC.popoverPresentationController?.delegate = self
            popoverVC.popoverPresentationController?.sourceView =  self.button
            popoverVC.popoverPresentationController?.sourceRect = button.bounds
            present(popoverVC, animated: true, completion: nil)
    }
    
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
        }
    
    
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
       }

    
       func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
           return true
       }
}
