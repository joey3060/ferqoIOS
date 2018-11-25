//
//  AppCoordinator.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/15.
//  Copyright © 2018 rae. All rights reserved.
//
import UIKit

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    let window: UIWindow?
    
    lazy var rootViewController: UINavigationController = {
        let navigation = UINavigationController(rootViewController: UIViewController())
        navigation.isNavigationBarHidden = true
        return navigation
    }()
    
    // MARK: - Coordinator
    init(window: UIWindow?) {
        self.window = window!
    }
    
    override func start() {
        guard let window = window else {
            return
        }
        
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    override func finish() {
        
    }
    
    func coordinateToSplash() {
        let coordinator = SplashCoordinator(window: self.window!)
        coordinator.delegate = self
        coordinator.start()
    }
    
    func coordinateToMain() {
        
    }
}

extension AppCoordinator: SplashViewControllerDelegate, LoginViewControllerDelegate, IntroViewControllerDelegate {
    func skipSplash() {
        let coordinator = IntroCoordinator(self.rootViewController)
        coordinator.delegate = self
        coordinator.start()
        window?.rootViewController = rootViewController
    }
    
    func skipIntro() {
        let coordinator = LoginCoordinator(self.rootViewController)
        coordinator.delegate = self
        coordinator.start()
        window?.rootViewController = rootViewController
    }
    
    func skipLogin() {
        let coordinator = MainCoordinator(self.rootViewController)
        coordinator.delegate = self
        coordinator.start()
        window?.rootViewController = rootViewController
    }
}
