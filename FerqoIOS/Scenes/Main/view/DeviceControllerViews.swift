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
    
    static func getVerticleButton(names: [String] = []) -> UIView {
        let wrapper = UIView()
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
        
        
        wrapper.addSubview(nowStack)
        
        
        nowStack.snp.makeConstraints {
            $0.width.equalTo(wrapper)
        }
        
        return wrapper
    }
    
    static func getGridButton(names: [String] = []) -> UIView {
        let wrapper = UIView()
        var nowStack: UIStackView!
        let col = 3
        for (index, element) in names.enumerated() {
            if index % col == 0 {
                let newStack = UIStackView()
                newStack.translatesAutoresizingMaskIntoConstraints = false
                newStack.distribution = .fillEqually
                newStack.axis = .horizontal
                newStack.alignment = .leading
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
            
            let newButton = ShadowRectButton()
            newButton.cornerRadius = 20
            newButton.setTitle("\(element)", for: .normal)
            newButton.translatesAutoresizingMaskIntoConstraints = false
            nowStack.addArrangedSubview(newButton)
        }
        
        let left = names.count % col
        for _ in 1..<left {
            nowStack.addArrangedSubview(UIView())
        }
        
        wrapper.snp.makeConstraints {
            $0.bottom.equalTo(nowStack)
        }
        
        return wrapper
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
