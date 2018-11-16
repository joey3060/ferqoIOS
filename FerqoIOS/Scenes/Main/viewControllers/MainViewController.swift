//
//  MainViewController.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/17.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    var menu: MenuTableViewController = MenuTableViewController()

    var viewModel: MainViewModel! {
        didSet {
            viewModel.viewDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addMenu()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        super.loadView()
    }
    
    func addMenu() {
        menu.viewModel = viewModel.coordinationDelegate?.menuTableViewModel
        addChild(menu)
        view.addSubview(menu.view)
        menu.didMove(toParent: self)
        menu.view.snp.makeConstraints{ (make) -> Void in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview()
        }
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
