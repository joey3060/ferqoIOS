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

    var viewModel: LoginViewModel! {
        didSet {
            viewModel.viewDelegate = self
        }
    }
    
    // 當鍵盤跑出來時，使用者點非鍵盤區域的畫面時
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func nextBtnClick(_ sender: Any) {
        viewModel.skipLogin()
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
}
