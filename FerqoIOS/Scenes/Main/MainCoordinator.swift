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
            let viewController = storyboard.instantiateViewController(withIdentifier: "mainSlideView") as! MainSlideViewController
            viewController.viewModel = mainSlideViewModel
            return viewController
        }
    }
    
    // global sensor
    var sensorViewController: SensorViewController! {
        get {
            let viewController = storyboard.instantiateViewController(withIdentifier: "sensorView") as! SensorViewController
            let viewModel = SensorViewModel()
            viewModel.coordinationDelegate = self
            viewController.viewModel = viewModel
            return viewController
        }
    }
    
    var sensorDetectViewController: SensorViewController! {
       let viewController = storyboard.instantiateViewController(withIdentifier: "sensorView") as! SensorViewController
        let viewModel = SensorViewModel()
        viewModel.coordinationDelegate = self
        viewModel.sensorType = 1
        viewController.viewModel = viewModel
        return viewController
    }
    
    var interphoneViewController: InterphoneViewController! {
        let viewController = storyboard.instantiateViewController(withIdentifier: "interphoneView") as! InterphoneViewController
        let viewModel = InterPhoneModel()
        viewModel.coordinationDelegate = self
        viewController.viewModel = viewModel
        return viewController
    }
    
    var interphoneControlViewController: CameraControlViewController! {
        let viewController = storyboard.instantiateViewController(withIdentifier: "cameraControl") as! CameraControlViewController
        let viewModel = CameraControlWithInterPhoneViewModel()
        viewModel.coordinationDelegate = self
        viewController.viewModel = viewModel
        return viewController
    }
    
    var alarmViewController: AlarmViewController! {
        let viewController = storyboard.instantiateViewController(withIdentifier: "alarmView") as! AlarmViewController
        let viewModel = AlarmViewModel()
        viewModel.coordinationDelegate = self
        viewController.viewModel = viewModel
        return viewController
    }

    var cameraListViewController: CameraListViewController! {
        let viewController = storyboard.instantiateViewController(withIdentifier: "cameraList") as! CameraListViewController
        let viewModel = CameraListViewModel()
        viewModel.coordinationDelegate = self
        viewController.viewModel = viewModel
        return viewController
    }
    
    var alarmSettingViewController: AlarmSettingViewController! {
        let viewController = storyboard.instantiateViewController(withIdentifier: "alarmSettingView") as! AlarmSettingViewController
        let viewModel = AlarmSettingViewModel()
        viewModel.coordinationDelegate = self
        viewController.viewModel = viewModel
        return viewController
    }
    //CameraControlViewModel
    var cameraControlViewController: CameraControlViewController! {
        let viewController = storyboard.instantiateViewController(withIdentifier: "cameraControl") as! CameraControlViewController
        let viewModel = CameraControlWithInterPhoneViewModel()
        viewModel.coordinationDelegate = self
        viewController.viewModel = viewModel
        return viewController
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
    
    func backToMain() {
        back()
    }
    
    func back() {
        rootViewController.popViewController(animated: true)
    }
    
//    func setHasHeader() {
//        rootViewController.setNavigationBarHidden(false, animated: false)
//        rootViewController.navigationBar.isTranslucent = false
//        rootViewController.navigationBar.tintColor = UIColor.white
//        rootViewController.navigationBar.barTintColor = UIColor(red: 48/255, green: 144/255, blue: 188/255, alpha: 1)
//    }
}

extension MainCoordinator {
    func goToSensorView() {
        rootViewController.pushViewController(sensorViewController, animated: true)
    }
    
    func goToSensorDetectView() {
        rootViewController.pushViewController(sensorDetectViewController, animated: true)
    }
    
    func goToInterPhoneView() {
        rootViewController.pushViewController(interphoneViewController, animated: true)
    }
    
    func goToInterPhoneControlView() {
        rootViewController.pushViewController(interphoneControlViewController, animated: true)
    }
    
    func goToAlarmView() {
        rootViewController.pushViewController(alarmViewController, animated: true)
    }
    
    func goToAlarmSettingView() {
        rootViewController.pushViewController(alarmSettingViewController, animated: true)
    }
    
    func goToCameraListView() {
        rootViewController.pushViewController(cameraListViewController, animated: true)
    }
    
    func goToCameraControlView() {
        rootViewController.pushViewController(cameraControlViewController, animated: true)
    }
}
