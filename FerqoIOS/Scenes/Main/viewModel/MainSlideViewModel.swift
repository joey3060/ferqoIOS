//
//  MainSlideViewModel.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/21.
//  Copyright © 2018 rae. All rights reserved.
//
import UIKit

class MainSlideViewModel {
    var coordinationDelegate: MainCoordinator!
    weak var viewDelegate: UIViewController?
    
    var roomName: String = ""
    
    func setRoomType(name: String) {
        roomName = name
    }
}
