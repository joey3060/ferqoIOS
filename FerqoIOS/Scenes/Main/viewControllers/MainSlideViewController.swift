//
//  MainSlideViewController.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/21.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

class MainSlideViewController: UIViewController {
    var viewModel: MainSlideViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    func configure(view: UIView) {
        switch view {
        case is SectionTitle:
            (view as! SectionTitle).viewModel = SectionViewModel()
            break
        default: break
        }
    }
}

extension MainSlideViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.datasource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.datasource[section].items.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel: TableViewSectionMap = viewModel.datasource[indexPath.section]//.items[indexPath.row]
        let cell = UINib(nibName: "SectionViews", bundle: nil).instantiate(withOwner: nil, options: nil)
        if (indexPath.row == 0) {
            if let cell = cell[0] as? SectionTitle {
                cell.title.text = cellViewModel.title
                configure(view: cell)
                return cell
            }
        }
        return UITableViewCell()
    }
}

extension MainSlideViewController: UITableViewDelegate {
    
}
