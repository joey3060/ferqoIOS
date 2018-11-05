//
//  ViewController.swift
//  FerqoIOS
//
//  Created by rae on 2018/11/5.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit
import ReSwiftRouter

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goToLoginAction(_ sender: Any) {
        mainStore.dispatch(SetRouteAction(["Login"]))
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
