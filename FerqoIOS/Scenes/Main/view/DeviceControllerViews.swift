//
//  ControllerViews.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/30.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit
import SnapKit

class DeviceControllerViews {
    static func getUpDownView(centerTitle title: String = "") -> ShaderView {
        let wrapper = ShaderView()
        
        let stackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [])
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            stackView.spacing = 8
            stackView.alignment = .center
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            return stackView
        }()
        let upBtn = UIButton()
        upBtn.setImage(UIImage(named: "left")?.rotate(withRotation: CGFloat(-Float.pi/2)), for: .normal)
        
        let centerLabel = UILabel()
        centerLabel.text = title
        
        let downBtn = UIButton()
        downBtn.setImage(UIImage(named: "left")?.rotate(withRotation: CGFloat(Float.pi/2)), for: .normal)
        
        stackView.addArrangedSubview(upBtn)
        stackView.addArrangedSubview(centerLabel)
        stackView.addArrangedSubview(downBtn)
        
        wrapper.addSubview(stackView)
        
        wrapper.snp.makeConstraints {
            $0.width.equalTo(72)
            $0.height.equalTo(184)
        }
        
        stackView.snp.makeConstraints {
            $0.top.bottom.left.right.equalTo(0)
        }
        
        return wrapper
    }
}
