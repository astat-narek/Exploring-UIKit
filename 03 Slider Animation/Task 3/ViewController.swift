//
//  ViewController.swift
//  Task 3
//
//  Created by Narek Danielyan on 07.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let movingView = UIView()
    let sliderControl = UISlider ()
    
    let animator = UIViewPropertyAnimator(duration: 0.7, curve: .easeOut)
    
    override func viewDidLoad() {
        super.viewDidLoad ()
        view.backgroundColor = .systemBackground
        movingView.backgroundColor = .systemBlue
        movingView.layer.cornerCurve = .continuous
        movingView.layer.cornerRadius = 8
        
        view.addSubview(movingView)
        view.addSubview (sliderControl)
        
        sliderControl.addAction(.init(handler: { _ in
            self.animator.fractionComplete = CGFloat (self.sliderControl.value)
        }), for: .valueChanged)
        
        sliderControl.addAction(.init(handler: { _ in
            self.animator.startAnimation()
            self.sliderControl.setValue(1, animated: true)
                
        }), for: [.touchUpInside, .touchUpOutside])
        
        animator.pausesOnCompletion = true
        
        animator.addAnimations {
            self.movingView.frame.origin.x = self.view.frame.width - self.view.layoutMargins.right - self.view.layoutMargins.left - self.movingView.frame.width
            self.movingView.transform = .identity.scaledBy(x: 1.5, y: 1.5) .rotated(by: .pi / 2)
        }
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews ()
        
        
        if movingView.transform == .identity {
            movingView.frame = .init(x: view.layoutMargins.left, y: 110, width: 80, height: 80)
            sliderControl.sizeToFit ()
            sliderControl.frame = .init(x: view.layoutMargins.left, y: movingView.frame.maxY + 44, width: view.frame.width -
                                        view.layoutMargins.left - view.layoutMargins.right, height: sliderControl.frame.height)
        }
        
        
        
        
    }
}


//class ViewController: UIViewController {
//
//    let slider: UISlider = UISlider()
//    let rect: UIView = UIView()
//
//    var margin: CGFloat {
//        view.layoutMargins.left
//    }
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemBackground
//        view.layoutMargins = view.safeAreaInsets
//
//        style()
//        layout()
//    }
//
//
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//
//        getNewPosition(for: rect, at: slider.value)
//    }
//
//
//    func style() {
//        rect.frame = CGRect(x: margin, y: 150, width: 100, height: 100)
//        rect.backgroundColor = .systemBlue
//        rect.layer.cornerRadius = 20
//        slider.addTarget(self, action: #selector(self.sliderValueDidChange(_:event:)), for: .valueChanged)
//    }
//
//
//    func layout() {
//        view.addSubview(slider)
//        view.addSubview(rect)
//        slider.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            slider.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
//            slider.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor),
//            slider.topAnchor.constraint(equalTo: view.topAnchor, constant: 300)
//        ])
//    }
//
//
//    @objc func sliderValueDidChange(_ sender: UISlider, event: UIEvent) {
//
//        if event.allTouches?.first?.phase == .ended {
//            UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseInOut]) { [self] in
//                slider.setValue(1, animated: true)
//                getNewPosition(for: rect, at: slider.value)
//            }
//        } else {
//            getNewPosition(for: rect, at: slider.value)
//        }
//    }
//
//
//    func getNewPosition(for rect: UIView, at sliderValue: Float) {
//
//        let sliderValue = CGFloat(sliderValue)
//
//        let degrees = 90 * sliderValue
//        let scale = 1 + (0.5 * sliderValue)
//        rect.transform = CGAffineTransformMakeRotation(degrees * .pi / 180).scaledBy(x: scale, y: scale)
//        let length = view.frame.width - rect.frame.width - 2 * margin
//        rect.layer.position.x = length * sliderValue + rect.frame.width / 2 + margin
//    }
//}
//
