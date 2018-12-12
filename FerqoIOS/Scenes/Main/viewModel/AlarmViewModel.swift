//
//  AlarmViewModel.swift
//  FerqoIOS
//
//  Created by rae on 2018/12/8.
//  Copyright © 2018 rae. All rights reserved.
//
import UIKit

class AlarmViewModel {
    var coordinationDelegate: MainCoordinator!
    weak var viewDelegate: UIViewController?
    
    var alarmHistory: [AlarmHistoryCell] = [
        AlarmHistoryCell(icon: "door", deviceName: "客廳_窗戶1", time: "On 2m15s"),
        AlarmHistoryCell(icon: "windows", deviceName: "客廳_窗戶1", time: "On 2m15s"),
    ]
    
}
