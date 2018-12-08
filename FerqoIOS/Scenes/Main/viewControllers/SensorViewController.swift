//
//  SensorViewController.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/12/3.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

class SensorViewController: UIViewController {
    var viewModel: SensorViewModel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var header: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(SensorViewCell.self, forCellReuseIdentifier: SensorViewCell.identifier)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 56, bottom: 0, right: 0)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
        
        if viewModel.sensorType == 0 {
            header.topItem?.title = "環境感測"
        } else {
            header.topItem?.title = "感應器"
        }
    }
    
    @IBAction func backToRoot(_ sender: Any) {
        viewModel.coordinationDelegate.backToMain()
    }
}

extension SensorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.sensorType == 1 {
            return viewModel.sensorDetectData[section].sensorData.count
        }
        return viewModel.sensorDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var data: SensorData
        let cell = tableView.dequeueReusableCell(withIdentifier: SensorViewCell.identifier, for: indexPath) as! SensorViewCell
        
        if viewModel.sensorType == 1 {
            data = viewModel.sensorDetectData[indexPath.section].sensorData[indexPath.row]
        } else {
            data = viewModel.sensorDatas[indexPath.row] as SensorData
        }
        
        cell.icon.image = UIImage(named: data.icon)!.withRenderingMode(.alwaysTemplate)
        if (data.offline) {
            cell.icon.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        } else {
            cell.icon.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        }
        cell.title.text = data.title
        cell.valueLabel.text = data.value
        return cell
    }
    
//    private func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if viewModel.sensorType == 1 {
//            return viewModel.sensorDetectData[section].roomName
//        }
//        return nil
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if viewModel.sensorType == 1 {
            return viewModel.sensorDetectData.count
        }
        return 1
    }
}

extension SensorViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if viewModel.sensorType == 1 {
            let roomName = viewModel.sensorDetectData[section].roomName
            let view = UIView()
            let label = UILabel()
            label.text = roomName
            
            view.addSubview(label)
            
            label.snp.makeConstraints {
                $0.leftMargin.rightMargin.equalTo(view).offset(16)
                $0.centerY.equalTo(view)
            }
            return view
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if viewModel.sensorType == 1 {
            return 48
        }
        return 0
    }
}
