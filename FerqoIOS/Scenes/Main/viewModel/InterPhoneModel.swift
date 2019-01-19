//
//  InterPhoneModel.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/12/8.
//  Copyright © 2018 rae. All rights reserved.
//
import UIKit

class InterPhoneModel {
    var coordinationDelegate: MainCoordinator!
    weak var viewDelegate: UIViewController?
    
    var interPhoneInPlace: [InterPhonePlace] = [
        InterPhonePlace(name: "大門", background: "bg"),
        InterPhonePlace(name: "後門", background: "bg")
    ]
}
