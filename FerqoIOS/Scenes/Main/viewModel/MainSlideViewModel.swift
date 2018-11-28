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
//    var height: Double { get }
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
            DeviceCardViewModel(),
        ], title: "裝置")
    ]
}


/* card view models */

struct SectionViewModel: TableViewItemViewModel {
    var reuseIdentifier: String = "cell.sectionViewModel"
}

struct DeviceCardViewModel: TableViewItemViewModel {
    var reuseIdentifier: String = "cell.deviceCardViewModel"
}
