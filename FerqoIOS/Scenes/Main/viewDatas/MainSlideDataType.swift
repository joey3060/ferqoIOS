//
//  MainSlideDataType.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/12/3.
//  Copyright © 2018 rae. All rights reserved.
//
protocol TableViewItemViewModel {
    var reuseIdentifier: String { get }
    var height: Double { get }
}

struct TableViewSectionMap {
    let section: TableViewItemViewModel?
    let items: [TableViewItemViewModel]
    var title: String = ""
}

struct SituationModel {
    var background: String = ""
    var title: String = ""
}

struct SituationData: TableViewItemViewModel {
    var reuseIdentifier: String = "cell"
    var height: Double = 100
    var items: [SituationModel] = []
    
    init(items: [SituationModel]) {
        self.items = items
    }
}
