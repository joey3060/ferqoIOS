//
//  LightDeviceController.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/12/1.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit
import SnapKit

class LightDeviceController: UIViewController, DeviceController {
    var viewHeight: Int = 200
    
    var baseView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView = setUpViews()
    }
}

extension LightDeviceController {
    func setUpViews() -> UIView {
        let baseView = UIView()
        let brightSlider = DeviceControllerViews.getSlider(name: "亮度", icon: ["reduce", "add"])
        let colorSlider = DeviceControllerViews.getSlider(name: "色彩", icon: [])
        
        baseView.addSubview(brightSlider)
        baseView.addSubview(colorSlider)
        view.addSubview(baseView)
        
        baseView.snp.makeConstraints {
            $0.width.equalTo(view)
            $0.top.equalTo(view)
            $0.bottom.equalTo(colorSlider)
        }
        
        brightSlider.snp.makeConstraints {
            $0.width.equalTo(baseView)
            $0.top.equalTo(baseView)
        }
        
        colorSlider.snp.makeConstraints {
            $0.top.equalTo(brightSlider.snp.bottom).offset(16)
            $0.width.equalTo(baseView)
        }
        
        return baseView
    }
}
