//
//  ProjectorDeviceController.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/28.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit
import SnapKit

class ProjectorDeviceController: UIViewController {
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [UIView()])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func setUpView() {
        let stack = stackView
        stack.snp.makeConstraints {
            $0.top.bottom.left.right.equalToSuperview()
        }
        view.addSubview(stack)
    }

}
