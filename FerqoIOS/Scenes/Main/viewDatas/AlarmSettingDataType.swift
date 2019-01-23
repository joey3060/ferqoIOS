//
//  AlarmSettingDataType.swift
//  FerqoIOS
//
//  Created by rae on 2019/1/19.
//  Copyright © 2019 rae. All rights reserved.
//

struct AlarmSettingData {
    var icon: String
    var title: String
    var value: String
    var offline: Bool = false
}

struct AlarmSettingRoomData {
    var roomName: String = ""
    var settingData: [AlarmSettingData] = []
}
