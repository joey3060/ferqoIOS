//
//  SplashCoordinator.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/15.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

class SplashCoordinator: Coordinator {
    let rootViewController: UINavigationController
    private var splashViewController: UIViewController!
    
    let storyboard = UIStoryboard(name: "Splash", bundle: nil)
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    override func start() {
        let splashVC: SplashViewController = storyboard.instantiateInitialViewController() as! SplashViewController
        
        rootViewController.setViewControllers([splashVC], animated: false)
        splashViewController = splashVC
        splashVC.coordinationDelegate = MainSplashCoordinator()
    }
}

class MainSplashCoordinator: CoordinationDelegate {
    func coordinateTransitionFrom(source: Coordinator, toDestination destination: UIViewController) {
    }
    
    func SplashViewControllerDidSelectNextView() {
        print("next test")
    }
}
