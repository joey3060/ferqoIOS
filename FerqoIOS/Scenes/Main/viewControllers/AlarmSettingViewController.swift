//
//  AlarmSettingViewController.swift
//  FerqoIOS
//
//  Created by rae on 2018/12/8.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

class AlarmSettingViewController: UIViewController {
    
    var viewModel: AlarmSettingViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    let fullScreenSize = UIScreen.main.bounds.size

    @IBAction func BackButton(_ sender: UIBarButtonItem) {
        viewModel.coordinationDelegate.backToMain()
    }
    
    @IBOutlet weak var Header: UINavigationBar!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        Header.topItem?.title = "警報設定"
        tableView.register(AlarmSettingViewCell.self, forCellReuseIdentifier: AlarmSettingViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)        
    }

}

extension AlarmSettingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return viewModel.SpaceSettingData.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var data: AlarmSettingData
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AlarmSettingViewCell.identifier, for: indexPath) as! AlarmSettingViewCell
        
        print(indexPath.section)
        print(indexPath.row)
        
        data = viewModel.SpaceSettingData[indexPath.section].settingData[indexPath.row]
        
        cell.icon.image = UIImage(named: data.icon)!.withRenderingMode(.alwaysTemplate)
        if (data.offline) {
            cell.icon.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        } else {
            cell.icon.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        }
        cell.title.text = data.title


        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.SpaceSettingData.count
    }
}

extension AlarmSettingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let roomName = viewModel.SpaceSettingData[section].roomName
        let view = UIView()
        let label = UILabel()
        let roomSwitch = UISwitch()
        label.text = roomName
        
        view.addSubview(label)
        view.addSubview(roomSwitch)
            
        label.snp.makeConstraints {
            $0.left.equalTo(view).offset(16)
            $0.centerY.equalTo(view)
        }
        
        roomSwitch.snp.makeConstraints {
            $0.left.equalTo(label.snp.right)
            $0.right.equalTo(view).offset(-17)
            $0.height.centerY.equalTo(20)
        }

        return view

    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }
    
    
}
