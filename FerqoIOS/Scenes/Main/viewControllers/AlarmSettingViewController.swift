//
//  AlarmSettingViewController.swift
//  FerqoIOS
//
//  Created by rae on 2018/12/8.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

class AlarmSettingViewController: UIViewController {
    
    var viewModel: AlarmSettingViewModel!

    @IBAction func BackButton(_ sender: UIBarButtonItem) {
        viewModel.coordinationDelegate.backToMain()
    }
    
    @IBOutlet weak var Header: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Header.topItem?.title = "警報設定"
        
    }

}
