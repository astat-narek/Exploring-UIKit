//
//  CustomAnimatedTransitioning.swift
//  Mafia
//
//  Created by Narek Danielyan on 17.04.2022.
//

import Foundation
import UIKit

final class CustomAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning, CustomAnimation {
    var isPresenting: Bool = true

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
        
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isPresenting {
            present(using: transitionContext)
        } else {
            dismiss(using: transitionContext)
        }
    }

    private func present(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toView = transitionContext.view(forKey: .to) else { return }
        
        let containerView = transitionContext.containerView
       
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.frame  = CGRect(x: 0, y: 0, width: 300, height: 300)
            imageView.center = containerView.center
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(systemName: "arrowshape.turn.up.forward.fill")
            imageView.tintColor = .lightGray
            return imageView
        }()
        
        containerView.addSubview(imageView)
        containerView.addSubview(toView)
        
        imageView.alpha = 1.0
        toView.alpha = 0.0
        
            
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toView.alpha = 1.0
            imageView.alpha = 0.0

        }, completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            imageView.removeFromSuperview()
        })
    }

    private func dismiss(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: .from) else { return }

        let containerView = transitionContext.containerView
       
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.frame  = CGRect(x: 0, y: 0, width: 300, height: 300)
            imageView.center = containerView.center
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(systemName: "arrowshape.turn.up.backward.fill")
            imageView.tintColor = .lightGray
            return imageView
        }()
        
        containerView.addSubview(fromView)
        containerView.addSubview(imageView)

        
        
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            fromView.alpha = 0.0
            imageView.alpha = 0.0
        }, completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            imageView.removeFromSuperview()

        })
    }
}
