//
//  ControlSlider.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/29.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

class ControlSlider: UISlider {
    private let lightBlue = UIColor(red: 48/255, green: 144/255, blue: 188/255, alpha: 0.32)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        let customBounds = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width, height: 16))
        super.trackRect(forBounds: customBounds)
        return customBounds
    }
}
