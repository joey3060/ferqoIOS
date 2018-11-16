//
//  SplashCoordinator.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/15.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

class SplashCoordinator: Coordinator {
    var delegate: SplashViewControllerDelegate?
    var window: UIWindow
    lazy var rootViewController: UINavigationController = {
        let navigation = UINavigationController(rootViewController: UIViewController())
        navigation.isNavigationBarHidden = true
        return navigation
    }()
    
    let storyboard = UIStoryboard(name: "Splash", bundle: nil)
    
    lazy var splashViewModel: SplashViewModel! = {
        let viewModel = SplashViewModel()
        viewModel.coordinationDelegate = self
        return viewModel
    }()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        let splashVC: SplashViewController = storyboard.instantiateInitialViewController() as! SplashViewController
        splashVC.viewModel = splashViewModel
        rootViewController.setViewControllers([splashVC], animated: false)
        window.rootViewController = self.rootViewController
    }
}

extension SplashCoordinator: SplashViewControllerDelegate {
    func skipSplash() {
        delegate?.skipSplash()
    }
}
