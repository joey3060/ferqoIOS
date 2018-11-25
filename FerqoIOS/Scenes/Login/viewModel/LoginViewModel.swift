//
//  LoginViewModel.swift
//  FerqoIOS
//
//  Created by rae on 2018/11/21.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

// route
protocol LoginViewControllerDelegate {
    func skipLogin()
}

class LoginViewModel {
    var coordinationDelegate: LoginCoordinator?
    
    weak var viewDelegate: UIViewController?
    
    func skipLogin() {
        coordinationDelegate?.skipLogin()
    }
    
}
