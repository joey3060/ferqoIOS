//
//  SituationButoon.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/12/3.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit
import SnapKit

class SituationButton: UICollectionViewCell {
    var imageView: UIImageView!
    var title: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        title = UILabel()
        title.textColor = .white
        title.text = "測試文字"
        title.font = UIFont.systemFont(ofSize: 20)
        title.layer.shadowColor = UIColor.black.cgColor
        title.layer.shadowRadius = 3
        title.layer.shadowOpacity = 0.8
        title.layer.shadowOffset = CGSize(width: 0, height: 3)
        title.layer.masksToBounds = false
        imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.isUserInteractionEnabled = false
        imageView.image = UIImage(named: "bg")
        contentView.addSubview(imageView)
        contentView.addSubview(title)
        imageView.snp.makeConstraints {
            $0.width.height.left.top.equalTo(self)
        }
        title.snp.makeConstraints {
            $0.left.top.right.equalTo(16)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.roundCorners(corners: [.bottomLeft,.bottomRight,.topLeft,.topRight], radius: 8)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
