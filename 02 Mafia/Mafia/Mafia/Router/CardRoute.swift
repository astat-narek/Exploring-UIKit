//
//  CardRoute.swift
//  Mafia
//
//  Created by Narek Danielyan on 18.04.2022.
//

import Foundation
import UIKit

protocol CardRoute {
    func openCardScreen()
}

extension CardRoute where Self: Router {
    func openCardScreen(with transition: Transition) {
        let router = DefaultRouter(rootTransition: transition)
        let viewModel = CardViewModel(router: router)
        let viewController = CardViewController(viewModel: viewModel)
        router.root = viewController

        route(to: viewController, as: transition)
    }

    func openCardScreen() {
        openCardScreen(with: AnimatedTransition(animatedTransition: FadeAnimatedTransitioning()))
    }
}

extension DefaultRouter: CardRoute {}
