//
//  SplashViewController.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/15.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    var viewModel: SplashViewModel! {
        didSet {
            viewModel.viewDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.skipSplash()
    }

}
