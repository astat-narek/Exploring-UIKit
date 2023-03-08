//
//  ViewController.swift
//  Task 3
//
//  Created by Narek Danielyan on 07.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let slider: UISlider = UISlider()
    let rect: UIView = UIView()
    
    var margin: CGFloat {
        view.layoutMargins.left
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.layoutMargins = view.safeAreaInsets
        
        style()
        layout()
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        getNewPosition(for: rect, at: slider.value)
    }
    
    
    func style() {
        rect.frame = CGRect(x: margin, y: 150, width: 100, height: 100)
        rect.backgroundColor = .systemBlue
        rect.layer.cornerRadius = 20
        slider.addTarget(self, action: #selector(self.sliderValueDidChange(_:event:)), for: .valueChanged)
    }
    
    
    func layout() {
        view.addSubview(slider)
        view.addSubview(rect)
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            slider.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            slider.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor),
            slider.topAnchor.constraint(equalTo: view.topAnchor, constant: 300)
        ])
    }
    
    
    @objc func sliderValueDidChange(_ sender: UISlider, event: UIEvent) {
        
        if event.allTouches?.first?.phase == .ended {
            UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseInOut]) { [self] in
                slider.setValue(1, animated: true)
                getNewPosition(for: rect, at: slider.value)
            }
        } else {
            getNewPosition(for: rect, at: slider.value)
        }
    }
    
    
    func getNewPosition(for rect: UIView, at sliderValue: Float) {
        
        let sliderValue = CGFloat(sliderValue)
        
        let degrees = 90 * sliderValue
        let scale = 1 + (0.5 * sliderValue)
        rect.transform = CGAffineTransformMakeRotation(degrees * .pi / 180).scaledBy(x: scale, y: scale)
        let length = view.frame.width - rect.frame.width - 2 * margin
        rect.layer.position.x = length * sliderValue + rect.frame.width / 2 + margin
    }
}

