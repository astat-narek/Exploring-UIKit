//
//  NewPlayViewModel.swift
//  Mafia
//
//  Created by Narek Danielyan on 17.04.2022.
//

import Foundation


final class NewPlayViewModel {
    typealias Routes = CardRoute & Closable
    private var router: Routes

    init(router: Routes) {
        self.router = router
    }

    func dismiss() {
        router.close()
    }

    func openItem() {
        router.openCardScreen()
    }
    
    func close() {
        router.close()
    }
}
