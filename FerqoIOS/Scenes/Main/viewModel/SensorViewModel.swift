//
//  SensorViewModel.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/12/3.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

class SensorViewModel {
    var coordinationDelegate: MainCoordinator!
    weak var viewDelegate: UIViewController?
    
    // 0 environment sensor, 1 sensors
    var sensorType: Int = 0
    
    var sensorDatas: [SensorData] = [
        SensorData( icon: "co2", title: "CO2", value: "256ppm", offline: false ),
        SensorData( icon: "wet", title: "濕度", value: "60%", offline: false )
    ]
    
    var sensorDetectData: [RoomData] = [
        RoomData(roomName: "1F 客廳", sensorData: [
            SensorData( icon: "windows", title: "窗戶1", value: "LOST", offline: true ),
            SensorData( icon: "close", title: "窗戶2", value: "Off 2m15s", offline: false ),
            SensorData( icon: "door", title: "窗戶2", value: "Off 2m15s", offline: false ),
        ]),
        RoomData(roomName: "房間 1", sensorData: [
            
        ])
    ]
}
