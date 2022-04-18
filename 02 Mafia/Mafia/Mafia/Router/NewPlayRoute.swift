//
//  CustomRoute.swift
//  Mafia
//
//  Created by Narek Danielyan on 17.04.2022.
//

import Foundation
import UIKit

protocol NewPlayRoute {
    func openNewGameScreen()
}

extension NewPlayRoute where Self: Router {
    func openNewGameScreen(with transition: Transition) {
        let router = DefaultRouter(rootTransition: transition)
        let viewModel = NewPlayViewModel(router: router)
        let viewController = NewPlayViewController(viewModel: viewModel)
        router.root = viewController
        
        route(to: viewController, as: transition)
    }

    func openNewGameScreen() {
        openNewGameScreen(with: AnimatedTransition(animatedTransition: FadeAnimatedTransitioning()))
    }
}

extension DefaultRouter: NewPlayRoute {}
