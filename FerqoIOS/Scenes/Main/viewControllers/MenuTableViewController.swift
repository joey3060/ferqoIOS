//
//  MenuTableViewController.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/17.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    var viewModel: MainViewModel! {
        didSet {
            viewModel.viewDelegate = self
        }
    }
    let cellIdentifier: String = "MyCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        tableView.register(UINib(nibName: "MenuItem", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MenuItem
        return cell
    }
    
    func style() {
        self.tableView.separatorColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 64, bottom: 0, right: 0)
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
        tableView.alwaysBounceVertical = false
    }
}

class MenuItem: UITableViewCell {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var type: UILabel!
}
