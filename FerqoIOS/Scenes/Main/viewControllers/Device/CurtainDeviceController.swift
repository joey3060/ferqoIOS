//
//  CurtainDeviceController.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/12/1.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit
import SnapKit

class CurtainDeviceController: UIViewController, DeviceController {
    var viewHeight: Int = 180
    
    var openCloseSliderView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        openCloseSliderView = setUpSliderView()
    }
}

extension CurtainDeviceController {
    func setUpSliderView() -> UIView {
        let openCloseSliderView = UIView()
        let slider = DeviceControllerViews.getSlider(name: "窗簾閉合", icon: ["reduce", "add"])
        let rotateBtn = ShadowRectButton()
        rotateBtn.cornerRadius = 24
        rotateBtn.needShadow = false
        rotateBtn.setTitle("旋轉", for: .normal)
        
        openCloseSliderView.addSubview(slider)
        openCloseSliderView.addSubview(rotateBtn)
        view.addSubview(openCloseSliderView)
        
        openCloseSliderView.snp.makeConstraints {
            $0.width.equalTo(view)
            $0.top.equalTo(view)
            $0.bottom.equalTo(rotateBtn)
        }
        
        slider.snp.makeConstraints {
            $0.width.equalTo(openCloseSliderView)
            $0.top.equalTo(openCloseSliderView)
        }
        
        rotateBtn.snp.makeConstraints {
            $0.top.equalTo(slider.snp.bottom).offset(16)
            $0.width.equalTo(openCloseSliderView)
            $0.height.greaterThanOrEqualTo(48)
        }
        
        return openCloseSliderView
    }
}
