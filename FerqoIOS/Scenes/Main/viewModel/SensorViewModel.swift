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
    
    var sensorDatas: [SensorData] = [
        SensorData( icon: "co2", title: "CO2", value: "256ppm" ),
        SensorData( icon: "wet", title: "濕度", value: "60%" )
    ]
}
