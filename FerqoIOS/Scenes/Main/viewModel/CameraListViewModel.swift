//
//  CameraListViewModel.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/12/9.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

class CameraListViewModel {
    var coordinationDelegate: MainCoordinator!
    weak var viewDelegate: UIViewController?
    
    var cameraList: [Camera] = [
        Camera(name: "客廳1", url: ""),
        Camera(name: "客廳2", url: ""),
        Camera(name: "客廳3", url: ""),
        Camera(name: "窗戶1", url: "")
    ]
}
