/// Copyright (c) 2020 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

final class PopAnimator: NSObject {
    var originFrame = CGRect()
    var presenting = true
    private let duration: TimeInterval = 1
    
}

extension PopAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        guard let herbView = transitionContext.view(forKey: presenting  ? .to : .from) else { return }
        
        let (initialFrame, finalFrame) =
        presenting
        ? (originFrame, herbView.frame)
        : (herbView.frame, originFrame)
        
        let scaleTransform =
        presenting
        ? CGAffineTransform(
            scaleX: initialFrame.width / finalFrame.width,
            y: initialFrame.height / finalFrame.height
        )
        :.init(
            scaleX: finalFrame.width / initialFrame.width,
            y: finalFrame.height / initialFrame.height
        )
        
        
        if presenting {
            herbView.transform = scaleTransform
            herbView.center = .init(x: initialFrame.midX, y: initialFrame.midY)
        }
        
        if let toView = transitionContext.view(forKey: .to) {
            containerView.addSubview(toView)
        }
        containerView.bringSubviewToFront(herbView)
        
        guard let herbDetailsContainer =
                ( transitionContext.viewController(forKey: presenting ? .to : .from) as? HerbDetailsViewController)?.containerView
        else { return }
        
        if presenting {
            herbDetailsContainer.alpha = 0
        }
        
        herbView.layer.cornerRadius = presenting ? 20 / scaleTransform.a : 0
        herbView.clipsToBounds = true
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0) {
            herbView.layer.cornerRadius = self.presenting ? 0 : 20 / scaleTransform.a
            herbView.transform = self.presenting ? .identity : scaleTransform
            herbView.center = .init(x: finalFrame.midX, y: finalFrame.midY)
            herbDetailsContainer.alpha = self.presenting ? 1 : 0
        } completion: { _ in
            if !self.presenting {
                (transitionContext.viewController(forKey: .to) as! ViewController)
                    .selectedImage.alpha = 1
            }
            transitionContext.completeTransition(true)
        }
    }
    
    
    
}
