//
//  ControllerViews.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/30.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit
import SnapKit

class DeviceControllerViews {
    static private let lightBlue = UIColor(red: 48/255, green: 144/255, blue: 188/255, alpha: 0.32)
    static private let blue = UIColor(red: 48/255, green: 144/255, blue: 188/255, alpha: 1)
    
    static func getNumberControlButton() -> UIView {
        let names = ["1", "2", "3", "4", "5", "6", "7", "8", "9", nil, "0", nil ]
        var elements: [UIView] = []
        for (_, element) in names.enumerated() {
            if (element == nil) {
                elements.append(UIView())
            } else {
                let wrapper = UIView()
                let newButton = ShadowRectButton()
                newButton.cornerRadius = 32
                newButton.setTitle("\(element ?? "")", for: .normal)
                newButton.translatesAutoresizingMaskIntoConstraints = false
                wrapper.addSubview(newButton)
                elements.append(wrapper)
                wrapper.snp.makeConstraints {
                    $0.height.equalTo(newButton)
                }
                newButton.snp.makeConstraints {
                    $0.width.height.equalTo(64)
                    $0.center.equalTo(wrapper)
                }
            }
        }
        
        return self.getGridView(elements: elements)
    }
    
    static func getSlider(name: String = "", icon: [String]) -> UIView {
        let wrapper = UIView()
        let textLabel = UILabel()
        textLabel.text = name
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
            if (icon.count>0) {
                imageView.image = UIImage(named: icon[0])
                imageView.image = imageView.image!.withRenderingMode(.alwaysTemplate)
                imageView.tintColor = lightBlue
                imageView.backgroundColor = .clear
                imageView.contentMode = .center
            }
            return imageView
        }()
        let voiceImageHigh: UIImageView = {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
            if (icon.count>1) {
                imageView.image = UIImage(named: icon[1])
                imageView.image = imageView.image!.withRenderingMode(.alwaysTemplate)
                imageView.tintColor = blue
                imageView.backgroundColor = .clear
                imageView.contentMode = .center
            }
            
            return imageView
        }()
        let slideBar: UIView = {
            let wrapper = UIView()
            let border = UIView()
            let slider = ControlSlider()
            let longPress                  = UILongPressGestureRecognizer(target: slider, action: #selector(slider.tapAndSlide))
            longPress.minimumPressDuration = 0
            slider.addGestureRecognizer(longPress)
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
                $0.width.equalTo(border)
            }
            voiceImageLow.snp.makeConstraints {
                $0.width.height.equalTo(48)
            }
            voiceImageHigh.snp.makeConstraints {
                $0.width.height.equalTo(48)
            }
            return wrapper
        }()
        
        stackView.addArrangedSubview(voiceImageLow)
        stackView.addArrangedSubview(slideBar)
        stackView.addArrangedSubview(voiceImageHigh)
        wrapper.addSubview(textLabel)
        wrapper.addSubview(stackView)
        
        wrapper.snp.makeConstraints {
            $0.bottom.equalTo(stackView)
        }
        
        textLabel.snp.makeConstraints {
            $0.top.width.equalTo(wrapper)
        }

        stackView.snp.makeConstraints {
            $0.top.equalTo(textLabel).offset(27)
            $0.width.equalTo(wrapper)
        }
        
        return wrapper
    }
    
    static func getVerticleButton(names: [String] = []) -> UIStackView {
        let nowStack = UIStackView()
        nowStack.distribution = .fillEqually
        nowStack.axis = .vertical
        nowStack.spacing = 16
        
        for (_, element) in names.enumerated() {
            let newButton = ShadowRectButton()
            newButton.cornerRadius = 24
            newButton.needShadow = false
            newButton.setTitle(element, for: .normal)
            nowStack.addArrangedSubview(newButton)
            
            newButton.snp.makeConstraints {
                $0.height.greaterThanOrEqualTo(48)
            }
        }
        
        return nowStack
    }
    
    static func getGridView(elements: [UIView]) -> UIView {
        let wrapper = UIView()
        var nowStack: UIStackView!
        let col = 3
        for (index, element) in elements.enumerated() {
            if index % col == 0 {
                let newStack = UIStackView()
                newStack.translatesAutoresizingMaskIntoConstraints = false
                newStack.distribution = .fillEqually
                newStack.axis = .horizontal
                newStack.alignment = .center
                newStack.spacing = 8
                
                wrapper.addSubview(newStack)
                newStack.snp.makeConstraints {
                    if (nowStack != nil) {
                        $0.top.equalTo(nowStack.snp.bottom).offset(9)
                    } else {
                        $0.top.equalTo(wrapper)
                    }
                    $0.width.equalTo(wrapper)
                }
                nowStack = newStack
            }
            
            nowStack.addArrangedSubview(element)
        }
        
        let left = elements.count % col
        if left > 0 {
            for _ in 1..<left {
                nowStack.addArrangedSubview(UIView())
            }
        }
        
        wrapper.snp.makeConstraints {
            $0.bottom.equalTo(nowStack)
        }
        
        return wrapper
    }
    
    static func getGridButton(names: [String] = []) -> UIView {
        var elements: [UIButton] = []
        for (_, element) in names.enumerated() {
            let newButton = ShadowRectButton()
            newButton.cornerRadius = 20
            newButton.setTitle("\(element)", for: .normal)
            newButton.translatesAutoresizingMaskIntoConstraints = false
            elements.append(newButton)
        }
        
        return self.getGridView(elements: elements)
    }
    
    static func getDirectionControl() -> UIView {
        let directionWrapper = UIView()
        let directionView = UIView()
        directionWrapper.layer.borderColor = lightBlue.cgColor
        directionWrapper.layer.borderWidth = 1
        directionWrapper.addSubview(directionView)
        let image = UIImage(named: "chevron")
        let buttonUp = UIButton()
        let buttonLeft = UIButton()
        let buttonRight = UIButton()
        let buttonBottom = UIButton()
        let okButton = ShadowRectButton()
        let menuButton = ShadowRectButton()
        let backButton = ShadowRectButton()
        buttonUp.setImage(image?.rotate(withRotation: CGFloat(Float.pi/2)).withRenderingMode(.alwaysTemplate), for: .normal)
        buttonLeft.setImage(image?.rotate(withRotation: CGFloat(-Float.pi)).withRenderingMode(.alwaysTemplate), for: .normal)
        buttonRight.setImage(image?.withRenderingMode(.alwaysTemplate), for: .normal)
        buttonBottom.setImage(image?.rotate(withRotation: CGFloat(-Float.pi/2)).withRenderingMode(.alwaysTemplate), for: .normal)
        okButton.setTitle("OK", for: .normal)
        menuButton.setTitle("Menu", for: .normal)
        backButton.setTitle("Back", for: .normal)
        
        directionView.addSubview(buttonUp)
        directionView.addSubview(buttonLeft)
        directionView.addSubview(buttonRight)
        directionView.addSubview(buttonBottom)
        directionView.addSubview(okButton)
        directionView.addSubview(menuButton)
        directionView.addSubview(backButton)
        
        func setButton(_ button: UIButton) {
            button.tintColor = blue
            button.imageView?.snp.makeConstraints {
                $0.width.height.equalTo(40)
            }
            button.snp.makeConstraints {
                $0.width.height.equalTo(48)
            }
        }
        
        func setRoundBtn(_ button: ShadowRectButton) {
            button.cornerRadius = 32
            button.needShadow = false
            button.snp.makeConstraints {
                $0.width.height.equalTo(64)
            }
        }
        
        setButton(buttonUp)
        setButton(buttonLeft)
        setButton(buttonRight)
        setButton(buttonBottom)
        setRoundBtn(okButton)
        setRoundBtn(menuButton)
        setRoundBtn(backButton)
        directionView.snp.makeConstraints {
            $0.width.equalTo(311)
            $0.height.equalTo(288)
            $0.center.equalTo(directionWrapper)
        }
        buttonUp.snp.makeConstraints {
            $0.top.equalTo(directionView).offset(8)
            $0.centerX.equalTo(directionView)
            $0.width.height.equalTo(48)
        }
        buttonLeft.snp.makeConstraints {
            $0.left.equalTo(directionView).offset(20)
            $0.centerY.equalTo(directionView).offset(-16)
        }
        buttonRight.snp.makeConstraints {
            $0.right.equalTo(directionView).offset(-20)
            $0.centerY.equalTo(directionView).offset(-16)
        }
        buttonBottom.snp.makeConstraints {
            $0.bottom.equalTo(directionView).offset(-24)
            $0.centerX.equalTo(directionView)
        }
        okButton.snp.makeConstraints {
            $0.centerX.equalTo(directionView)
            $0.centerY.equalTo(directionView).offset(-16)
        }
        menuButton.snp.makeConstraints {
            $0.left.equalTo(directionView).offset(8)
            $0.bottom.equalTo(directionView).offset(-8)
        }
        backButton.snp.makeConstraints {
            $0.right.equalTo(directionView).offset(-8)
            $0.bottom.equalTo(directionView).offset(-8)
        }
        return directionWrapper
    }
    
    static func getUpDownView(centerTitle title: String = "") -> ShaderView {
        let wrapper = ShaderView()
        
        let stackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [])
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            stackView.spacing = 8
            stackView.alignment = .center
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            return stackView
        }()
        let upBtn = UIButton()
        upBtn.setImage(UIImage(named: "left")?.rotate(withRotation: CGFloat(-Float.pi/2)), for: .normal)
        
        let centerLabel = UILabel()
        centerLabel.text = title
        
        let downBtn = UIButton()
        downBtn.setImage(UIImage(named: "left")?.rotate(withRotation: CGFloat(Float.pi/2)), for: .normal)
        
        stackView.addArrangedSubview(upBtn)
        stackView.addArrangedSubview(centerLabel)
        stackView.addArrangedSubview(downBtn)
        
        wrapper.addSubview(stackView)
        
        wrapper.snp.makeConstraints {
            $0.width.equalTo(72)
            $0.height.equalTo(184)
        }
        
        stackView.snp.makeConstraints {
            $0.top.bottom.left.right.equalTo(0)
        }
        
        return wrapper
    }
}
