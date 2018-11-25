//
//  LoginCoordinator.swift
//  FerqoIOS
//
//  Created by rae on 2018/11/21.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

class LoginCoordinator: Coordinator {
    
    var delegate: LoginViewControllerDelegate?
    
    let rootViewController: UINavigationController
    
    private var loginViewController: UIViewController!
    
    let storyboard = UIStoryboard(name: "Login", bundle: nil)
    
    lazy var loginViewModel: LoginViewModel! = {
        let viewModel = LoginViewModel()
        viewModel.coordinationDelegate = self
        return viewModel
    }()
    
    init(_ rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    override func start() {
        let loginVC: LoginViewController = storyboard.instantiateInitialViewController() as! LoginViewController
        
        loginVC.viewModel = loginViewModel
        rootViewController.setViewControllers([loginVC], animated: false)
        loginViewController = loginVC
    }
}

extension LoginCoordinator: LoginViewControllerDelegate {
    func skipLogin() {
        delegate?.skipLogin()
    }
}
