//
//  File.swift
//  FerqoIOS
//
//  Created by rae on 2018/12/9.
//  Copyright © 2018 rae. All rights reserved.
//

import Foundation
import UIKit

class AlarmSettingViewModel {
    var coordinationDelegate: MainCoordinator!
    weak var viewDelegate: UIViewController?
    
    var SettingData: [AlarmSettingData] = [
        AlarmSettingData( icon: "co2", title: "CO2", value: "256ppm", offline: false ),
        AlarmSettingData( icon: "wet", title: "濕度", value: "60%", offline: false )
    ]
    
    var SpaceSettingData: [AlarmSettingRoomData] = [
        AlarmSettingRoomData(roomName: "1F 客廳", settingData: [
            AlarmSettingData( icon: "windows", title: "窗戶1", value: "LOST", offline: true ),
            AlarmSettingData( icon: "close", title: "窗戶2", value: "Off 2m15s", offline: false ),
            AlarmSettingData( icon: "door", title: "窗戶2", value: "Off 2m15s", offline: false ),
        ]),
        AlarmSettingRoomData(roomName: "房間 1", settingData: [
            AlarmSettingData( icon: "windows", title: "窗戶1", value: "LOST", offline: true ),
            AlarmSettingData( icon: "close", title: "窗戶2", value: "Off 2m15s", offline: false ),
            AlarmSettingData( icon: "door", title: "窗戶2", value: "Off 2m15s", offline: false ),
        ])
    ]
    
}
