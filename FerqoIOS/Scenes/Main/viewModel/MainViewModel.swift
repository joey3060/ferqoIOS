//
//  MainViewModel.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/17.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

struct pageSettings: pageStruct {
    var name: String = "Hello，今日好嗎？"
}

class MainViewModel {
    var coordinationDelegate: MainCoordinator?
    weak var viewDelegate: UIViewController?
    
    var pageSetting: pageStruct = pageSettings()
    
    var menuOpen = false
    
    var tabViewList: Array<TabRoomType> = [
        TabRoomType(roomName: "總控制", viewController: nil),
        TabRoomType(roomName: "客廳", viewController: nil),
        TabRoomType(roomName: "房間1", viewController: nil),
        TabRoomType(roomName: "房間2", viewController: nil),
        TabRoomType(roomName: "其他", viewController: nil),
    ]
}
