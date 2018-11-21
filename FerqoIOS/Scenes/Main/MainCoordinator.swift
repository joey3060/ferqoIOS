//
//  MainCoordinator.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/16.
//  Copyright © 2018 rae. All rights reserved.
//
import UIKit

class MainCoordinator: Coordinator {
    var delegate: Coordinator?
    let rootViewController: UINavigationController
    private var mainViewController: UIViewController!
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    lazy var mainViewModel: MainViewModel! = {
        let viewModel = MainViewModel()
        viewModel.coordinationDelegate = self
        return viewModel
    }()
    
    lazy var menuTableViewModel: MenuTableViewModel! = {
        let viewModel = MenuTableViewModel()
        viewModel.coordinationDelegate = self
        return viewModel
    }()
    
    var mainSlideViewModel: MainSlideViewModel! {
        let viewModel = MainSlideViewModel()
        viewModel.coordinationDelegate = self
        return viewModel
    }
    
    // auto give a new class object
    var mainSlideViewController: MainSlideViewController! {
        get {
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainSlideView") as! MainSlideViewController
            viewController.viewModel = mainSlideViewModel
            return viewController
        }
    }
    
    init(_ rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    override func start() {
        let mainVC: MainViewController = storyboard.instantiateInitialViewController() as! MainViewController
        
        mainVC.viewModel = mainViewModel
//        let mainVC: MenuTableViewController = MenuTableViewController()
//        rootViewController.isNavigationBarHidden = false
//        rootViewController.navigationBar.prefersLargeTitles = true
        rootViewController.setViewControllers([mainVC], animated: false)
        mainViewController = mainVC
    }
}
