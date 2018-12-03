//
//  MainSlideViewModel.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/21.
//  Copyright © 2018 rae. All rights reserved.
//
import UIKit

protocol SlideViewCellType {
    var viewModel: TableViewItemViewModel! { get set }
}


class MainSlideViewModel {
    var coordinationDelegate: MainCoordinator!
    weak var viewDelegate: UIViewController?
    
    var roomName: String = ""
    
    func setRoomType(name: String) {
        roomName = name
    }
    
    var datasource: [TableViewSectionMap] = [
        TableViewSectionMap(section: SectionViewModel(), items: [
            SituationData(items: [
                SituationModel(background: "bg", title: "回家模式"),
                SituationModel(background: "bg", title: "關閉回家"),
            ]),
        ], title: "情境"),
        TableViewSectionMap(section: SectionViewModel(), items: [
            DeviceCardViewModel(icon: "aircondition", title: "冷氣"),
            DeviceCardViewModel(icon: "light2", title: "客廳變色燈"),
            DeviceCardViewModel(icon: "curtain", title: "窗簾"),
            DeviceCardViewModel(icon: "tv", title: "電視"),
            DeviceCardViewModel(icon: "tv", title: "電視"),
            DeviceCardViewModel(icon: "projector", title: "投影機"),
            DeviceCardViewModel(icon: "projector", title: "投影機"),
        ], title: "裝置")
    ]
}


/* card view models */

struct SectionViewModel: TableViewItemViewModel {
    var reuseIdentifier: String = "cell.sectionViewModel"
    var height: Double = 60
}

protocol DeviceController {
    var viewHeight: Int { get }
}

class DeviceCardViewModel: TableViewItemViewModel {
    var reuseIdentifier: String = "cell.deviceCardViewModel"
    var height: Double = 250
    var isOpen: Bool = false
    var view: CardView!
    var icon: String = ""
    var title: String = ""
    
    var expandController: UIViewController!
    
    init() {
        
    }
    
    init(icon: String, title: String) {
        self.title = title
        self.icon = icon
        
        switch icon {
        case "projector":
            expandController = ProjectorDeviceController()
            height = Double((expandController as! DeviceController).viewHeight)
            break
        case "tv":
            expandController = TVDeviceController()
            height = Double((expandController as! DeviceController).viewHeight)
            break
        case "curtain":
            expandController = CurtainDeviceController()
            height = Double((expandController as! DeviceController).viewHeight)
            break
        case "light2":
            expandController = LightDeviceController()
            height = Double((expandController as! DeviceController).viewHeight)
            break
        case "aircondition":
            expandController = AirconditionDeviceController()
            height = Double((expandController as! DeviceController).viewHeight)
            break
        default:
            expandController = UIViewController()
            break
        }
    }
}
