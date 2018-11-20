//
//  LoginViewController.swift
//  FerqoIOS
//
//  Created by rae on 2018/11/5.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var IPTextField: UITextField!
    @IBOutlet weak var AccountTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IPTextField.setBottomBorder()
        AccountTextField.setBottomBorder()
        PasswordTextField.setBottomBorder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
