//
//  PopoverViewController.swift
//  Task 5
//
//  Created by Narek Danielyan on 14.03.2023.
//

import Foundation
import UIKit


class PopoverViewController: UIViewController {
    
    let closeButton: UIButton = UIButton(type: .close)
    let bulbImage = UIImageView(image: UIImage(systemName: "lightbulb"), highlightedImage: UIImage(systemName: "lightbulb.fill"))
    let segmentControl: UISegmentedControl = UISegmentedControl(items: ["280 pt", "150 pt"])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupView()
        layoutView()
    }

    
    private func setupView() {
        closeButton.addTarget(self, action: #selector(close), for: .primaryActionTriggered)
        
        segmentControl.selectedSegmentIndex = 0
        segmentControl.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
        
        bulbImage.contentMode = .scaleAspectFill
    }
    
    
    private func layoutView() {
        view.addSubview(closeButton)
        view.addSubview(segmentControl)
        view.addSubview(bulbImage)
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        bulbImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            
            segmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            
            bulbImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bulbImage.heightAnchor.constraint(equalToConstant: 45),
            bulbImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 65)
        ])
    }
}


extension PopoverViewController {
    
    @objc func close() {
        dismiss(animated: true)
    }
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl) {
        
        let firstSelected = segmentControl.selectedSegmentIndex == 0
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
            let viewHeight = firstSelected ? 280 : 150
            self.preferredContentSize = CGSize(width: 300, height: viewHeight)
        }
        
        self.bulbImage.tintColor = firstSelected ? .systemBlue : .systemYellow
        self.bulbImage.isHighlighted = !firstSelected
    }
}
