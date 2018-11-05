//
//  RouterModel.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/6.
//  Copyright © 2018 rae. All rights reserved.
//
import UIKit

class RouterModel {
    var rootController: UIViewController!
    var nowView: UIViewController!
    
    init(_ navigation: UIViewController) {
        rootController = navigation
    }
    
    func loadToRoute(_ id: String, board: String = "Main" ) -> RouterModel {
        nowView = UIStoryboard(name: board, bundle: nil)
            .instantiateViewController(withIdentifier: id) as UIViewController
        
        return self
    }
    
    func preset() {
        rootController.present(nowView, animated: true, completion:nil)
        rootController = nowView
    }
}
