//
//  Transitions.swift
//  Mafia
//
//  Created by Narek Danielyan on 17.04.2022.
//

import Foundation
import UIKit


protocol Transition: AnyObject {
    func open(_ viewController: UIViewController, from: UIViewController, completion: (() -> Void)?)
    func close(_ viewController: UIViewController, completion: (() -> Void)?)
}



// MARK: - EMPTY TRANSITION
final class EmptyTransition: Transition {
    func open(_ viewController: UIViewController, from: UIViewController, completion: (() -> Void)?) {}
    func close(_ viewController: UIViewController, completion: (() -> Void)?) {}
}

final class PushTransition: NSObject {
    var isAnimated: Bool = true

    private weak var from: UIViewController?
    private var openCompletionHandler: (() -> Void)?
    private var closeCompletionHandler: (() -> Void)?

    private var navigationController: UINavigationController? {
        guard let navigation = from as? UINavigationController else { return from?.navigationController }
        return navigation
    }

    init(isAnimated: Bool = true) {
        self.isAnimated = isAnimated
    }
}


// MARK: - MODAL TRANSITION
final class ModalTransition: Transition {
    func open(_ viewController: UIViewController, from: UIViewController, completion: (() -> Void)?) {
        from.present(viewController, animated: true, completion: completion)
    }

    func close(_ viewController: UIViewController, completion: (() -> Void)?) {
        viewController.dismiss(animated: true, completion: completion)
    }
}




// MARK: PUSH TRANSITION
extension PushTransition: Transition {
    func open(_ viewController: UIViewController, from: UIViewController, completion: (() -> Void)?) {
        self.from = from
        openCompletionHandler = completion
        navigationController?.delegate = self
        navigationController?.pushViewController(viewController, animated: isAnimated)
    }

    func close(_ viewController: UIViewController, completion: (() -> Void)?) {
        closeCompletionHandler = completion
        navigationController?.popViewController(animated: isAnimated)
    }
}

extension PushTransition: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let transitionCoordinator = navigationController.transitionCoordinator,
            let fromVC = transitionCoordinator.viewController(forKey: .from),
            let toVC = transitionCoordinator.viewController(forKey: .to) else { return }

        if fromVC == from {
            openCompletionHandler?()
            openCompletionHandler = nil
        } else if toVC == from {
            closeCompletionHandler?()
            closeCompletionHandler = nil
        }
    }
}


