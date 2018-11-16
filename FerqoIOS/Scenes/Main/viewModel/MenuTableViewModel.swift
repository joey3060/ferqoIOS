//
//  MenuTableViewModel.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/17.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

class MenuTableViewModel {
    var coordinationDelegate: MainCoordinator?
    weak var viewDelegate: UIViewController?
    
    var menuList: Array<MenuItemType> = [
        MenuItemType(icon: "alert2", text: "警報器"),
        MenuItemType(icon: "sensor", text: "環境感測"),
        MenuItemType(icon: "mic", text: "對講機"),
        MenuItemType(icon: "filled", text: "感應器"),
        MenuItemType(icon: "alarm", text: "監視器"),
    ]
}
