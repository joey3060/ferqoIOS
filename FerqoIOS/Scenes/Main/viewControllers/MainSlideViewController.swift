//
//  MainSlideViewController.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/21.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

class MainSlideViewController: UIViewController {
    var viewModel: MainSlideViewModel!
    
    @IBOutlet var typeName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(viewModel.roomName)
        typeName?.text = viewModel.roomName
        // Do any additional setup after loading the view.
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
