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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        style()
        layout()
    }

    
    
    func style() {
        rect.frame = CGRect(x: 20, y: 150, width: 100, height: 100)
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
        
        let length = view.frame.width-rect.frame.width-40
        
        
        if let touchEvent = event.allTouches?.first {
                switch touchEvent.phase {
                case .began:
                    print("began")
                case .moved:
                    print("moved: \(slider.value)")
                    let degrees = 90*CGFloat(slider.value)
                    let scale = 1+(0.5*CGFloat(slider.value))
                    rect.transform = CGAffineTransformMakeRotation(degrees * .pi/180).scaledBy(x: scale, y: scale)

                    rect.layer.position.x = CGFloat(slider.value)*(length)+rect.frame.width/2+20
                case .ended:
                    
                    UIView.animate(withDuration: 0.1, delay: 0) { [self] in
                        slider.setValue(1, animated: false)
                        print(slider.value)
                        let degrees = 90*CGFloat(slider.value)
                        let scale = 1+(0.5*CGFloat(slider.value))
                        rect.transform = CGAffineTransformMakeRotation(degrees * .pi/180).scaledBy(x: scale, y: scale)

                        rect.layer.position.x = view.frame.width-rect.frame.width/2-20
                    }
                    
                default:
                    break
                }
            }
    }
}

