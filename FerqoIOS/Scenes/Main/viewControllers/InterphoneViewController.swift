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
        tableView.separatorInset = UIEdgeInsets(top: 17,left: 0,bottom: 0,right: 0)
        tableView.separatorStyle = .none
    }
    

    @IBAction func backToMain(_ sender: Any) {
        viewModel.coordinationDelegate.backToMain()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
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
