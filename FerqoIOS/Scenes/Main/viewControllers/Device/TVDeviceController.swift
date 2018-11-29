//
//  TVDeviceController.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/29.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

class TVDeviceController: UIViewController, DeviceController {
    var viewHeight: Int = 600
    
    private let lightBlue = UIColor(red: 48/255, green: 144/255, blue: 188/255, alpha: 0.32)
    private let blue = UIColor(red: 48/255, green: 144/255, blue: 188/255, alpha: 1)
    
    var channelView: UIView!
    var volumeView: UIView!
    var controllerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        channelView = setUpSelectChannel()
        volumeView = setUpVolumeView()
        controllerView = setUpControllerView()
    }
}

extension TVDeviceController {
    func setUpControllerView() -> UIView {
        let controllerView = UIView()
        let stackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [])
            stackView.axis = .horizontal
            stackView.distribution = .fill
            stackView.spacing = 55
            stackView.alignment = .center
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            return stackView
        }()
        let backToChannelBtn = ShadowRectButton()
        backToChannelBtn.setBackgroundColor(blue, for: .normal)
        backToChannelBtn.setTitle("返回頻道", for: .normal)
        backToChannelBtn.setTitleColor(UIColor.white, for: .normal)
        
        stackView.addArrangedSubview(DeviceControllerViews.getUpDownView(centerTitle: "CH"))
        stackView.addArrangedSubview(DeviceControllerViews.getUpDownView(centerTitle: "Vol"))
        
        controllerView.addSubview(stackView)
        controllerView.addSubview(backToChannelBtn)
        view.addSubview(controllerView)
        
        controllerView.snp.makeConstraints {
            $0.top.equalTo(volumeView.snp.bottom).offset(16)
            $0.width.equalTo(view)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(controllerView)
            $0.centerX.equalTo(view)
        }
        
        backToChannelBtn.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(20)
            $0.width.equalTo(controllerView)
            $0.height.equalTo(50).priority(500)
        }
        
        return controllerView
    }
    
    func setUpVolumeView() -> UIView {
        let volumeView = UIView()
        let label = UILabel()
        label.text = "音量"
        let stackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [])
            stackView.axis = .horizontal
            stackView.distribution = .fill
            stackView.spacing = 8
            stackView.alignment = .center
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            return stackView
        }()
        let voiceImageLow: UIImageView = {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
            imageView.image = UIImage(named: "voiceLow")
            imageView.image = imageView.image!.withRenderingMode(.alwaysTemplate)
            imageView.tintColor = lightBlue
            imageView.backgroundColor = .clear
            imageView.contentMode = .center
            
            return imageView
        }()
        let voiceImageHigh: UIImageView = {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
            imageView.image = UIImage(named: "voiceHigh")
            imageView.image = imageView.image!.withRenderingMode(.alwaysTemplate)
            imageView.tintColor = blue
            imageView.backgroundColor = .clear
            imageView.contentMode = .center
            
            return imageView
        }()
        let slideBar: UIView = {
            let wrapper = UIView()
            let border = UIView()
            let slider = ControlSlider()
            slider.tintColor = blue
            slider.maximumTrackTintColor = .clear
            border.layer.borderWidth = 1
            border.layer.borderColor = lightBlue.cgColor
            border.layer.cornerRadius = 8
            wrapper.addSubview(border)
            wrapper.addSubview(slider)
            wrapper.bringSubviewToFront(slider)
            wrapper.snp.makeConstraints {
                $0.height.equalTo(16)
            }
            border.snp.makeConstraints {
                $0.top.bottom.left.right.equalTo(0)
            }
            slider.snp.makeConstraints {
                $0.top.bottom.left.right.equalTo(0)
            }
            voiceImageLow.snp.makeConstraints {
                $0.width.height.equalTo(48)
            }
            voiceImageHigh.snp.makeConstraints {
                $0.width.height.equalTo(48)
            }
            return wrapper
        }()
        
        
        volumeView.addSubview(label)
        
        stackView.addArrangedSubview(voiceImageLow)
        stackView.addArrangedSubview(slideBar)
        stackView.addArrangedSubview(voiceImageHigh)
        
        volumeView.addSubview(stackView)
        view.addSubview(volumeView)
        
        volumeView.snp.makeConstraints {
            $0.top.equalTo(channelView.snp.bottom).offset(16)
            $0.width.equalTo(view)
            $0.bottom.equalTo(stackView.snp.bottom)
        }
        
        label.snp.makeConstraints {
            $0.top.equalTo(volumeView.snp.top).offset(16)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(16)
            $0.width.equalTo(volumeView)
            $0.height.equalTo(48)
        }
        
        return volumeView
    }
    
    func setUpSelectChannel() -> UIView {
        let channelView: UIView = UIView()
        let stackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [])
            stackView.axis = .horizontal
            stackView.distribution = .fill
            stackView.spacing = 8
            stackView.alignment = .center
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            return stackView
        }()
        
        let channelSelectBtn: UIButton = {
            let button = UIButton()
            button.layer.borderColor = lightBlue.cgColor
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 4
            return button
        }()
        
        let label = UILabel()
        label.text = "選台"
        
        let arrowImgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        arrowImgView.image = UIImage(named: "left")?.rotate(withRotation: CGFloat(Float.pi))
        arrowImgView.backgroundColor = .clear
        arrowImgView.contentMode = .scaleAspectFit
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(arrowImgView)
        
        channelSelectBtn.addSubview(stackView)
        channelView.addSubview(channelSelectBtn)
        
        view.addSubview(channelView)
        
        channelView.snp.makeConstraints {
            $0.top.equalTo(0)
            $0.bottom.equalTo(channelSelectBtn.snp.bottom)
        }
        
        arrowImgView.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }
        
        channelSelectBtn.snp.makeConstraints {
            $0.top.equalTo(channelView)
            $0.width.equalTo(view).offset(16)
            $0.left.right.equalTo(-8)
        }
        
        stackView.snp.makeConstraints {
            $0.top.bottom.left.right.equalTo(channelSelectBtn).inset(UIEdgeInsets(top: 12, left: 8, bottom: 12, right: 20))
            $0.leading.trailing.equalTo(8)
        }
        
        return channelView
    }
}
