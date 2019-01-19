//
//  CameraViews.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/12/9.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit
import SnapKit

class CameraViews {
    static func getCameraView() -> UIView {
        let wrapper = UIView()
        let viewer = UIImageView()
        
        viewer.contentMode = .scaleAspectFit
        viewer.image = UIImage(named: "bg")
        
        wrapper.addSubview(viewer)
        
        viewer.snp.makeConstraints {
            $0.centerY.width.equalTo(wrapper)
        }
        
        return wrapper
    }
    
    static func getFunctionButtons() -> UIView {
        let wrapper = UIView()
        let stack = UIStackView()
        let images = ["mic", "mic", "mic", "voiceHigh"]
        
        stack.distribution = .equalSpacing
        stack.axis = .horizontal
        stack.spacing = 20
        
        images.forEach { (imageName) -> Void in
            let button = UIButton()
            button.setImage(UIImage(named: imageName)!.withRenderingMode(.alwaysTemplate), for: .normal)
            button.imageEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            button.imageView?.contentMode = .scaleAspectFit
            button.imageView?.tintColor = UIColor.black
            stack.addArrangedSubview(button)
            
            button.snp.makeConstraints {
                $0.width.height.equalTo(48)
            }
        }
        
        wrapper.addSubview(stack)
        
        stack.snp.makeConstraints {
            $0.width.equalTo(68 * images.count)
            $0.center.equalTo(wrapper)
        }
        
        return wrapper
    }
}
