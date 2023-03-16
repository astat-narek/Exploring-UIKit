//
//  ViewController.swift
//  Task 6
//
//  Created by Narek Danielyan on 16.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let square: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
        view.addGestureRecognizer(tap)
        
        square.frame = CGRect(origin: .zero, size: CGSize(width: 100, height: 100))
        square.center = view.center
        square.backgroundColor = .systemBlue
        square.layer.cornerRadius = 8
        view.addSubview(square)
    }
    
    
    @objc func didTap(_ gesture: UITapGestureRecognizer) {
        
        let tapPoint = gesture.location(in: view)
        
        let xDirection: CGFloat = tapPoint.x > self.square.center.x ? 1 : -1
        let yDirection: CGFloat = tapPoint.y < self.square.center.y ? 1 : -1
     
        let angleCorrection = xDirection * yDirection
        
        let animator = UIViewPropertyAnimator(duration: 0.7, dampingRatio: 0.7) {
                            self.square.center = tapPoint
            self.square.transform = self.square.transform.rotated(by: 0.5 * angleCorrection)
        }
        
        animator.addAnimations({
            self.square.transform = self.square.transform.rotated(by: -0.5 * angleCorrection)
        }, delayFactor: 0.15)
        
        animator.startAnimation()
    }
}

