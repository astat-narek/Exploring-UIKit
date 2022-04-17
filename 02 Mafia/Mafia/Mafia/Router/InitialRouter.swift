//
//  InitialRouter.swift
//  Mafia
//
//  Created by Narek Danielyan on 17.04.2022.
//

import Foundation
import UIKit

protocol InitialRoute {
    func makeInitialScreen() -> UIViewController
}


extension InitialRoute where Self: Router {
    func makeInitialScreen() -> UIViewController {
        let router = DefaultRouter(rootTransition: EmptyTransition())
        let viewModel = MainViewModel(router: router)
        let viewController = MainViewController(viewModel: viewModel)
        router.root = viewController
        
        return viewController
    }
}
 
extension DefaultRouter: InitialRoute {}
