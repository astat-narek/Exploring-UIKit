//
//  CustomRoute.swift
//  Mafia
//
//  Created by Narek Danielyan on 17.04.2022.
//

import Foundation
import UIKit

protocol CustomRoute {
    func openCustomScreen()
}

extension CustomRoute where Self: Router {
    func openNewGameScreen(with transition: Transition) {
        let router = DefaultRouter(rootTransition: transition)
        let viewModel = NewPlayViewModel(router: router)
        let viewController = NewPlayViewController(viewModel: viewModel)
        router.root = viewController
        
        route(to: viewController, as: transition)
    }

    func openCustomScreen() {
        openNewGameScreen(with: AnimatedTransition(animatedTransition: FadeAnimatedTransitioning()))
    }
}

extension DefaultRouter: CustomRoute {}
