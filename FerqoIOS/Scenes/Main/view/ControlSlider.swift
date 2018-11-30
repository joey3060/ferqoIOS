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
    
    @objc
    func tapAndSlide(gesture: UILongPressGestureRecognizer) {
        let pt = gesture.location(in: self)
        let thumbWidth = self.thumbRect().size.width
        var value: Float = 0
        
        if (pt.x <= self.thumbRect().size.width / 2) {
            value = self.minimumValue
        } else if (pt.x >= self.bounds.size.width - thumbWidth / 2) {
            value = self.maximumValue
        } else {
            let percentage = Float((pt.x - thumbWidth / 2) / (self.bounds.size.width - thumbWidth))
            let delta = percentage * (self.maximumValue - self.minimumValue)
            value = self.minimumValue + delta
        }
        
        if (gesture.state == UIGestureRecognizer.State.began) {
            UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseInOut,
                                       animations: {
                                        self.setValue(value, animated: true)
                                        super.sendActions(for: UIControl.Event.valueChanged)
            }, completion: nil)
        } else {
            self.setValue(value, animated: false)
            super.sendActions(for: UIControl.Event.valueChanged)
        }
    }
    
    func thumbRect() -> CGRect {
        return self.thumbRect(forBounds: self.bounds, trackRect: self.bounds, value: self.value)
    }
}
