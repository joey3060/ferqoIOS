//
//  SensorViewDataType.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/12/6.
//  Copyright © 2018 rae. All rights reserved.
//

struct SensorData {
    var icon: String
    var title: String
    var value: String
    var offline: Bool = false
}

struct RoomData {
    var roomName: String = ""
    var sensorData: [SensorData] = []
}
