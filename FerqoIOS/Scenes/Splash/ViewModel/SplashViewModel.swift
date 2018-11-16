//
//  SplashViewModelType.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/16.
//  Copyright © 2018 rae. All rights reserved.
//
import UIKit

// route
protocol SplashViewControllerDelegate {
    func skipSplash()
}

class SplashViewModel {
    var coordinationDelegate: SplashCoordinator?
    weak var viewDelegate: UIViewController?
    
    func skipSplash() {
        coordinationDelegate?.skipSplash()
    }
}
