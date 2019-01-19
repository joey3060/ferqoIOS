//
//  CameraControlViewController.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/12/9.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit
import SnapKit

class CameraControlViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    let wrapperStackView: UIStackView = UIStackView()
    var cameraView: UIView!
    var toolBox: UIView!
    
    var viewModel: CameraControlWithInterPhoneViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.topItem?.title = viewModel.headerTitle
        setUp()
    }
    
    @IBAction func back(_ sender: Any) {
        viewModel.coordinationDelegate.back()
    }
    
    func setUp() {
        wrapperStackView.axis = .vertical
        wrapperStackView.distribution = .fill

        cameraView = CameraViews.getCameraView()
        toolBox = CameraViews.getFunctionButtons()
        
        wrapperStackView.addArrangedSubview(cameraView)
        wrapperStackView.addArrangedSubview(toolBox)
        
        containerView.addSubview(wrapperStackView)
        
        
        wrapperStackView.snp.makeConstraints {
            $0.right.bottom.top.left.equalTo(containerView).inset(UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0))
        }
        
        cameraView.snp.makeConstraints {
            $0.width.equalTo(wrapperStackView)
        }
        
        toolBox.snp.makeConstraints {
            $0.width.equalTo(wrapperStackView)
            $0.height.equalTo(50)
        }
        
    }

}
