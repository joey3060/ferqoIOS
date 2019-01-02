//
//  MainDataType.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/18.
//  Copyright © 2018 rae. All rights reserved.
//
import UIKit

protocol pageStruct {
    var name: String { get set }
}

struct TabRoomType {
    var roomName: String = ""
    var viewController: MainSlideViewController?
}
