//
//  ShaderView.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/30.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

class ShaderView: UIView {
    private var shadowLayer: CAShapeLayer!
    private var cornerRadius: CGFloat = 37.5 {
        didSet {
            self.layoutSubviews()
        }
    }
    private var fillColor: UIColor = UIColor(red: 48/255, green: 144/255, blue: 188/255, alpha: 1)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
            shadowLayer.fillColor = UIColor.white.cgColor
            
            shadowLayer.shadowColor = fillColor.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 0.0, height: 2)
            shadowLayer.shadowOpacity = 0.5
            shadowLayer.shadowRadius = 4
            
            layer.insertSublayer(shadowLayer, at: 0)
        }
    }
}
