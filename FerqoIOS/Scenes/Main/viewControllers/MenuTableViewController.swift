//
//  MenuTableViewController.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/17.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit
import SnapKit

protocol MenuDelegate {
    func selectOnMenu(data: MenuItemType)
}

class MenuTableViewController: UITableViewController {

    var viewModel: MenuTableViewModel! {
        didSet {
            viewModel.viewDelegate = self
        }
    }
    let cellIdentifier: String = "MyCell"
    
    var delegate: MenuDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        tableView.register(UINib(nibName: "MenuItem", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.menuList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MenuItem
        cell.type.text = viewModel.menuList[indexPath.row].text
        cell.icon.tintColor = UIColor(red: 139/255, green: 193/255, blue: 217/255, alpha: 1)
        cell.icon.image = UIImage(named: viewModel.menuList[indexPath.row].icon)?.withRenderingMode(.alwaysTemplate)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data: MenuItemType = viewModel.menuList[indexPath.row]
        if delegate != nil {
            delegate.selectOnMenu(data: data)
        }
    }
    
    func style() {
        tableView.contentInset = UIEdgeInsets(top: 75,left: 0,bottom: 0,right: 0)
        tableView.separatorColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 64, bottom: 0, right: 0)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        // UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
        tableView.alwaysBounceVertical = false
        tableView.snp.makeConstraints{ (make) -> Void in
            make.size.width.equalTo(280)
        }
        tableView.layer.shadowColor = UIColor.black.cgColor
        tableView.layer.shadowOpacity = 0.5
        tableView.layer.shadowOffset = CGSize(width: 0, height: 0)
        tableView.layer.shadowRadius = 5
        tableView.clipsToBounds = false
        
    }
}

class MenuItem: UITableViewCell {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var type: UILabel!
}
