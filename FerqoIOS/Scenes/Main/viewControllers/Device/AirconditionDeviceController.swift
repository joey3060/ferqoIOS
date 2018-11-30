//
//  AirconditionDeviceController.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/12/1.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit
import SnapKit

class AirconditionDeviceController: UIViewController, DeviceController {
    var viewHeight: Int = 440
    
    var baseView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView = setUpViews()
    }
}

extension AirconditionDeviceController {
    func setUpViews() -> UIView {
        let baseView = UIView()
        let timeLabel = UILabel()
        let brightSlider = DeviceControllerViews.getSlider(name: "溫度", icon: ["reduce", "add"])
        let airType = DeviceControllerViews.getGridButton(names: ["冷氣", "暖氣", "送風"])
        let otherFunc = DeviceControllerViews.getVerticleButton(names: ["除濕", "風向"])
        let timeOut = DeviceControllerViews.getGridButton(names: ["30 min", "1 hr", "3hr"])
        
        timeLabel.text = "時間"
        
        baseView.addSubview(brightSlider)
        baseView.addSubview(airType)
        baseView.addSubview(otherFunc)
        baseView.addSubview(timeLabel)
        baseView.addSubview(timeOut)
        view.addSubview(baseView)
        
        baseView.snp.makeConstraints {
            $0.width.equalTo(view)
            $0.top.equalTo(view)
            $0.bottom.equalTo(timeOut)
        }
        
        brightSlider.snp.makeConstraints {
            $0.width.equalTo(baseView)
            $0.top.equalTo(baseView)
        }
        
        airType.snp.makeConstraints {
            $0.width.equalTo(baseView)
            $0.top.equalTo(brightSlider.snp.bottom).offset(25)
        }
        
        otherFunc.snp.makeConstraints {
            $0.width.equalTo(baseView)
            $0.top.equalTo(airType.snp.bottom).offset(25)
        }
        
        timeLabel.snp.makeConstraints {
            $0.width.equalTo(baseView)
            $0.top.equalTo(otherFunc.snp.bottom).offset(16)
        }
        
        timeOut.snp.makeConstraints {
            $0.width.equalTo(baseView)
            $0.top.equalTo(timeLabel.snp.bottom).offset(16)
        }
        return baseView
    }
}
