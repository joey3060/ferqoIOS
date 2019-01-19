//
//  File.swift
//  FerqoIOS
//
//  Created by rae on 2018/12/12.
//  Copyright © 2018 rae. All rights reserved.
//

import Foundation
import UIKit
extension UIDevice {
    static public func isX() -> Bool {
        if UIScreen.main.bounds.height == 812 || UIScreen.main.bounds.height == 896 {
            return true
        }
        
        return false
    }
}
