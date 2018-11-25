//
//  IntroCoordinator.swift
//  FerqoIOS
//
//  Created by rae on 2018/11/23.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

class IntroCoordinator: Coordinator {
    
    var delegate: IntroViewControllerDelegate?
    
    let rootViewController: UINavigationController
    
    private var introViewController: UIViewController!
    
    let storyboard = UIStoryboard(name: "Intro", bundle: nil)
    
    lazy var introViewModel: IntroViewModel! = {
        let viewModel = IntroViewModel()
        viewModel.coordinationDelegate = self
        return viewModel
    }()
    
    init(_ rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    override func start() {
        let introVC: IntroViewController = storyboard.instantiateInitialViewController() as! IntroViewController
        introVC.viewModel = introViewModel
        rootViewController.setViewControllers([introVC], animated: false)
    }
}

extension IntroCoordinator: IntroViewControllerDelegate {
    func skipIntro() {
        delegate?.skipIntro()
    }
}
