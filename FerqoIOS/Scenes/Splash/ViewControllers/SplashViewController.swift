//
//  SplashViewController.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/15.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

// route
protocol SplashViewControllerDelegate: CoordinationDelegate {
    func SplashViewControllerDidSelectNextView()
}

class SplashViewController: UIViewController {
    var coordinationDelegate: CoordinationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let delegrate = self.coordinationDelegate as? MainSplashCoordinator
        delegrate?.SplashViewControllerDidSelectNextView()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
