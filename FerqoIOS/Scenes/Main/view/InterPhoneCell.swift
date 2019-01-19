//
//  InterPhoneCell.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/12/8.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit
import SnapKit

class InterPhoneCell: UITableViewCell {

    var bgImage: UIImageView!
    var title: UILabel!
    var gradient: CAGradientLayer!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layOut()
        addSeparator()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layOut()
        addSeparator()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
        
        title.textColor = UIColor.white
        title.font = title.font.withSize(20)
        self.backgroundView = bgImage

        addSubview(title)
        
        contentView.snp.makeConstraints {
            $0.height.equalTo(278)
        }
        
        bgImage.snp.makeConstraints {
            $0.width.height.left.top.equalTo(contentView).priority(400)
            $0.height.equalTo(261)
        }
        
        title.snp.makeConstraints {
            $0.left.top.equalTo(contentView).offset(16)
        }
        
    }
    
    func addSeparator() {
        let separatorHeight: CGFloat = 17
        let frame = CGRect(x: 0, y: bounds.height - separatorHeight, width: bounds.width, height: separatorHeight)
        let separator = UIView(frame: frame)
        separator.backgroundColor = .white
        separator.autoresizingMask = [.flexibleTopMargin, .flexibleWidth]
        
        addSubview(separator)
    }

}
