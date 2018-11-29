//
//  MainSlideViewModel.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/21.
//  Copyright © 2018 rae. All rights reserved.
//
import UIKit

protocol TableViewItemViewModel {
    var reuseIdentifier: String { get }
    var height: Double { get }
}

protocol SlideViewCellType {
    var viewModel: TableViewItemViewModel! { get set }
}

struct TableViewSectionMap {
    let section: TableViewItemViewModel?
    let items: [TableViewItemViewModel]
    var title: String = ""
}

class MainSlideViewModel {
    var coordinationDelegate: MainCoordinator!
    weak var viewDelegate: UIViewController?
    
    var roomName: String = ""
    
    func setRoomType(name: String) {
        roomName = name
    }
    
    var datasource: [TableViewSectionMap] = [
        TableViewSectionMap(section: SectionViewModel(), items: [], title: "情境"),
        TableViewSectionMap(section: SectionViewModel(), items: [
            DeviceCardViewModel(icon: "projector", title: "投影機"),
            DeviceCardViewModel(icon: "tv", title: "電視"),
        ], title: "裝置")
    ]
}


/* card view models */

struct SectionViewModel: TableViewItemViewModel {
    var reuseIdentifier: String = "cell.sectionViewModel"
    var height: Double = 60
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
            break
        case "tv":
            expandController = UIViewController()
            break
        default:
            expandController = UIViewController()
            break
        }
    }
}
