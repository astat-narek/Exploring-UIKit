//
//  AppDelegate.swift
//  Mafia
//
//  Created by Narek Danielyan on 17.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
//        window?.rootViewController = MainViewController()
        
        let router = DefaultRouter(rootTransition: EmptyTransition())
        
        window?.rootViewController = router.makeInitialScreen()
        
        return true
    }
}
