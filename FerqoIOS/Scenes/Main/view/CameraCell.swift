//
//  CameraCellCollectionViewCell.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/12/9.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit
import SnapKit

class CameraCell: UICollectionViewCell {
    var bgImage: UIImageView!
    var title: UILabel!
    var gradient: CAGradientLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layOut()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        gradient.frame = bgImage.bounds
    }
    
    func layOut() {
        gradient = CAGradientLayer()
        bgImage = UIImageView()
        title = UILabel()
        
        gradient.frame = bgImage.frame
        gradient.colors = [
            UIColor(red: 0, green: 0, blue: 0, alpha: 0.56).cgColor,
            UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 0).cgColor
        ]
        bgImage.layer.addSublayer(gradient)
        
        bgImage.contentMode = .scaleAspectFill
        bgImage.clipsToBounds = true
        
        bgImage.image = UIImage(named: "bg")
        
        title.textColor = UIColor.white
        title.font = title.font.withSize(20)
        self.backgroundView = bgImage
        
        addSubview(title)
        
//        contentView.snp.makeConstraints {
//            $0.width.equalTo(171)
//            $0.height.equalTo(152)
//        }
//        
        bgImage.snp.makeConstraints {
            $0.left.top.width.height.equalTo(contentView)
//            $0.height.equalTo(contentView)
        }
        
        title.snp.makeConstraints {
            $0.left.top.equalTo(contentView).offset(8)
        }
    }
}
