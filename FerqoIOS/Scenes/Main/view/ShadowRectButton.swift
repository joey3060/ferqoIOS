//
//  ShadowButton.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/29.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

class ShadowRectButton: UIButton {
    var shadowAdded: Bool = false
    
    @IBInspectable var cornerRadius: CGFloat = 4 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
//    override var backgroundColor: UIColor? {
//        didSet {
//            if ((self.shadowLayer) != nil) {
//                shadowLayer.backgroundColor = backgroundColor
//            }
//        }
//    }
    
    var shadowLayer: UIView!
    let blue = UIColor(red: 48/255, green: 144/255, blue: 188/255, alpha: 0.56).cgColor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)

        if shadowAdded { return }
        shadowAdded = true

        let blue = UIColor(red: 48/255, green: 144/255, blue: 188/255, alpha: 0.56).cgColor

        self.clipsToBounds = true
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 1
        self.layer.borderColor = blue
        shadowLayer = UIView(frame: self.frame)
        shadowLayer.backgroundColor = .clear
        shadowLayer.layer.backgroundColor = UIColor.clear.cgColor
        shadowLayer.layer.shadowColor = blue
        shadowLayer.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius).cgPath
        shadowLayer.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        shadowLayer.layer.shadowOpacity = 0.5
        shadowLayer.layer.shadowRadius = 4
        shadowLayer.layer.masksToBounds = true
        shadowLayer.clipsToBounds = false

        self.superview?.addSubview(shadowLayer)
        self.superview?.bringSubviewToFront(self)
    }
    
    func setUp() {
        self.setTitleColor(.black, for: .normal)
        self.setBackgroundColor(.white, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.snp.makeConstraints {
            $0.height.size.equalTo(42).priority(200)
        }
    }
    
    func rotate(rotation: CGFloat) {
        self.imageView?.transform = self.imageView!.transform.rotated(by: rotation)
    }
}
