//
//  AlarmViewController.swift
//  FerqoIOS
//
//  Created by rae on 2018/12/8.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit
import SnapKit

class AlarmViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var viewModel: AlarmViewModel!
    
    @IBOutlet weak var Header: UINavigationBar!
    
    let fullScreenSize = UIScreen.main.bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Header.topItem?.title = "警報"
        
//        alarmRecordTitle()
//        separator(height: 145.0)
//        alarmRecordTable()
//        monitorTitle()
//        separator(height: 500)
//        monitorHorizontalScrollView()
//        toggleAlarmButton()
        
        layout()
    }
    
    @IBAction func BackButton(_ sender: UIBarButtonItem) {
        viewModel.coordinationDelegate.backToMain()
    }
    
    func layout() {
        
//        let containerStack = UIStackView(axis: .vertical)
//
//
//        let container = UIView(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width, height: fullScreenSize.height))
////        let AlarmRecordTitle: UIView = alarmRecordTitle()
////        let Separator: UIView = separator(height: 145.0)
////        let AlarmRecordTable: UIView = alarmRecordTable()
//        let alarmRecordSection = UIView(frame: CGRect(x: 0, y: fullScreenSize.height * 0.023, width: fullScreenSize.width, height: fullScreenSize.height * 0.4))
//
//        alarmRecordSection.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1)
//
//        let monitorSection = UIView(frame: CGRect(x:0, y: fullScreenSize.height * 0.4023, width: fullScreenSize.width, height: fullScreenSize.height * 0.3))
//
//        monitorSection.backgroundColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
//
//        let alarmButtonSection = UIView(frame: CGRect(x:0 ,y: fullScreenSize.height * 0.76, width: fullScreenSize.width, height: fullScreenSize.height * 0.14))
//
//        alarmButtonSection.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
//
//        container.addSubview(alarmRecordSection)
//        container.addSubview(monitorSection)
//        container.addSubview(alarmButtonSection)
//
//        view.addSubview(container
        
        var containerHeight: CGFloat {
            if UIDevice.isX() {
                return 88
            }
            return 64
        }
        
        let container = UIView(frame: CGRect(x: CGFloat(0), y: containerHeight, width: fullScreenSize.width, height: fullScreenSize.height - containerHeight))
        
        container.backgroundColor = UIColor.white
        
        let AlarmRecordTitle = alarmRecordTitle()
        let AlarmSeparator = separator(height: 58)
        let AlarmRecordTable = alarmRecordTable()
        let MonitorTitle = monitorTitle()
        let MonitorSeparator = separator(height: 341)
        let MonitorHorizontalScrollView = monitorHorizontalScrollView()
        let ToggleAlarmButton = toggleAlarmButton()
        
        container.addSubview(AlarmRecordTitle)
        container.addSubview(AlarmSeparator)
        container.addSubview(AlarmRecordTable)
        container.addSubview(MonitorTitle)
        container.addSubview(MonitorSeparator)
        container.addSubview(MonitorHorizontalScrollView)
        container.addSubview(ToggleAlarmButton)
        
        self.view.addSubview(container)
    }
    
    
    func alarmRecordTitle() -> UIView {
        let title = UILabel(frame: CGRect(
            x: 17, y: 32,
            width: fullScreenSize.width,
            height: 16
        ))

        title.text = "歷史紀錄"

        title.textColor = UIColor(red:0.20, green:0.20, blue:0.20, alpha:1.0)

        title.font = UIFont(name: "Helvetica-Light", size: 17)

        title.textAlignment = .left

        title.numberOfLines = 1

        return title

    }

    func separator(height: CGFloat) -> UIView {
        let separator = UIView()
        separator.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        separator.frame = CGRect(x: 17, y: height, width: fullScreenSize.width - 35, height: 1.0)
        return separator
    }

    func monitorTitle() -> UIView {
        let title = UILabel(frame: CGRect(
            x: 17, y: 315,
            width: fullScreenSize.width,
            height: 16
        ))

        title.text = "監視器"

        title.textColor = UIColor(red:0.20, green:0.20, blue:0.20, alpha:1.0)

        title.font = UIFont(name: "Helvetica-Light", size: 17)

        title.textAlignment = .left

        title.numberOfLines = 1

        return title
    }
    
    func monitorHorizontalScrollView() -> UIView {
        let scrollView = UIScrollView(frame: CGRect(x: 17, y: 351, width: fullScreenSize.width, height: 160))

        scrollView.delegate = self

        scrollView.contentSize = CGSize(width: fullScreenSize.width * 2, height: 152)

        scrollView.isScrollEnabled = true

        scrollView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

        var monitorView = UIView()

        for i in 0...3 {
            monitorView = UIView(frame: CGRect(x: 171 * i + (i * 5), y: 0, width: 171, height: 152))
            monitorView.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)

            let color = ((CGFloat(i) + 0.5) * (CGFloat(i+1) + 0.5)) / 20.0

            print(color)

            monitorView.backgroundColor = UIColor(red: color, green: color, blue: color, alpha: 1)

            monitorView.tag = i
            scrollView.addSubview(monitorView)
        }

        return scrollView
    }

    func alarmRecordTable() -> UIView {
        let alarmRecordTable = UITableView(frame: CGRect(
            x: 0 , y: 68,
            width: fullScreenSize.width - 35,
            height: 219
            ),
                                           style: .plain
        )
        // 註冊 cell
        alarmRecordTable.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        // 設定委任對象
        alarmRecordTable.delegate = self
        alarmRecordTable.dataSource = self

        alarmRecordTable.dragInteractionEnabled = false

        // 不允許點 cell
        alarmRecordTable.allowsSelection = false

        // 不可多選 cell
        alarmRecordTable.allowsMultipleSelection = false

        alarmRecordTable.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: alarmRecordTable.frame.size.width, height: 1))

        return alarmRecordTable

    }

    func toggleAlarmButton() -> UIView {
        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 0, y: 0, width: 311.0, height: 48.0)
        button.backgroundColor = UIColor(red:0.74, green:0.19, blue:0.19, alpha:1.0)
        button.setTitle("啟動警報", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.center = CGPoint(x: fullScreenSize.width / 2, y: 561)
        return button
    }

    // 設定Table的行數
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    // 設定每個Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = "hello"
        return cell
    }
    
}
