//
//  AlarmSettingCell.swift
//  FerqoIOS
//
//  Created by rae on 2019/1/19.
//  Copyright © 2019 rae. All rights reserved.
//

import UIKit
import SnapKit

class AlarmSettingViewCell: UITableViewCell {
    var icon: UIImageView!
    var title: UILabel!
    var deviceSwitch: UISwitch!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layOut()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layOut()
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
    }
    
    func layOut() {
        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.distribution = .equalSpacing
            stackView.alignment = .center
            return stackView
        }()
        
        icon = UIImageView()
        title = UILabel()
        deviceSwitch = UISwitch()
        
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(deviceSwitch)
        
        addSubview(icon)
        addSubview(stackView)
        
        icon.snp.makeConstraints {
            $0.left.equalTo(contentView).offset(20)
            $0.centerY.equalTo(self)
            $0.width.height.equalTo(24)
        }
        stackView.snp.makeConstraints {
            $0.left.equalTo(icon.snp.right).offset(20)
            $0.right.equalTo(contentView).offset(-16)
            $0.height.centerY.equalTo(self)
        }
    }
}
