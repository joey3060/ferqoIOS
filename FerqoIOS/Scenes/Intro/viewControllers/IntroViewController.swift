//
//  IntroViewController.swift
//  FerqoIOS
//
//  Created by rae on 2018/11/23.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {
    
    @IBAction func goToLoginButton(_ sender: UIButton) {
        viewModel.skipIntro()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var viewModel: IntroViewModel! {
        didSet {
            viewModel.viewDelegate = self
        }
    }
    

}
