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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(SensorViewCell.self, forCellReuseIdentifier: SensorViewCell.identifier)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 56, bottom: 0, right: 0)
        tableView.dataSource = self
        
    }
    
    @IBAction func backToRoot(_ sender: Any) {
        viewModel.coordinationDelegate.backToMain()
    }
}

extension SensorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sensorDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = viewModel.sensorDatas[indexPath.row] as SensorData
        let cell = tableView.dequeueReusableCell(withIdentifier: SensorViewCell.identifier, for: indexPath) as! SensorViewCell
        
        cell.icon.image = UIImage(named: data.icon)
        cell.title.text = data.title
        cell.valueLabel.text = data.value
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
