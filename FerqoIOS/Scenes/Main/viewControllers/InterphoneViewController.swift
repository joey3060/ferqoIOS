//
//  InterphoneViewController.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/12/8.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

class InterphoneViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: InterPhoneModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(InterPhoneCell.self, forCellReuseIdentifier: InterPhoneCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorInset = UIEdgeInsets(top: 17,left: 0,bottom: 0,right: 0)
        tableView.separatorStyle = .none
    }
    

    @IBAction func backToMain(_ sender: Any) {
        viewModel.coordinationDelegate.backToMain()
    }
}

extension InterphoneViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.interPhoneInPlace.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InterPhoneCell.identifier) as! InterPhoneCell
        let data = viewModel.interPhoneInPlace[indexPath.row]
        cell.title.text = data.name
        cell.bgImage.image = UIImage(named: data.background)
        return cell
    }
}

extension InterphoneViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let _ = viewModel.interPhoneInPlace[indexPath.row] // TODO: send the data to control view
        viewModel.coordinationDelegate.goToInterPhoneControlView()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
