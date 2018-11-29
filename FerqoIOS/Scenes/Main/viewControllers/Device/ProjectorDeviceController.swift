//
//  ProjectorDeviceController.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/28.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit
import SnapKit

class ProjectorDeviceController: UIViewController, DeviceController {
    
    var viewHeight: Int = 90
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    

    func setUpView() {
        
        let stack = stackView
        let iconBtn1 = ShadowRectButton()
        let iconBtn2 = ShadowRectButton()
        let iconBtn3 = ShadowRectButton()
        
        iconBtn1.rotate(rotation: CGFloat(Double.pi / 2))
        iconBtn3.rotate(rotation: CGFloat(-Double.pi / 2))
        
        iconBtn1.setImage(UIImage(named: "left"), for: .normal)
        iconBtn2.setImage(UIImage(named: "pause"), for: .normal)
        iconBtn3.setImage(UIImage(named: "left"), for: .normal)
        
        stackView.addArrangedSubview(iconBtn3)
        stackView.addArrangedSubview(iconBtn2)
        stackView.addArrangedSubview(iconBtn1)

        view.addSubview(stack)
        stack.snp.makeConstraints {
//            $0.edges.equalTo(view).inset(UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0))
            $0.leading.top.trailing.equalTo(0)
        }
    }

}
