//
//  IntroViewModel.swift
//  FerqoIOS
//
//  Created by rae on 2018/11/23.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

// route
protocol IntroViewControllerDelegate {
    func skipIntro()
}

class IntroViewModel {
    var coordinationDelegate: IntroCoordinator?
    
    weak var viewDelegate: UIViewController?
    
    func skipIntro() {
        coordinationDelegate?.skipIntro()
    }
    
}
