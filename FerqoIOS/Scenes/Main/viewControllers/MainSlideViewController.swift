//
//  MainSlideViewController.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/21.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit
import SnapKit

protocol CardViewDelegate {
    func clickEvent(indexPath: IndexPath?)
}

class MainSlideViewController: UIViewController {
    var viewModel: MainSlideViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    internal var selectedIndexPath: IndexPath? {
        didSet {
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        }
    }
    internal var isOpen: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 100
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.cellLayoutMarginsFollowReadableWidth = false
    }

    func configure(view: UITableViewCell) {
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
                cell.backgroundColor = .clear
                configure(view: cell)
                return cell
            }
        }
        if (indexPath.section != 0 && indexPath.row > 0) {
            if let cell = cell[2] as? CardView {
                cell.indexPath = indexPath
                cell.viewModel = viewModel.datasource[indexPath.section].items[indexPath.row - 1] as? DeviceCardViewModel
                cell.parentDelegate = self
                cell.parentController = self
                configure(view: cell)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if cell is CardView {
            cell.backgroundColor = .clear
            cell.frame = CGRect(x: 0, y: 0, width: cell.frame.width, height: 100)
            cell.preservesSuperviewLayoutMargins = false
        }
    }
}

extension MainSlideViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == selectedIndexPath {
            let cellViewModel: DeviceCardViewModel = viewModel.datasource[indexPath.section].items[indexPath.row-1] as! DeviceCardViewModel
            return (cellViewModel.isOpen ? CGFloat(cellViewModel.height) : UITableView.automaticDimension)
        }
        
        if (indexPath.row > 0) {
            return CGFloat(120)
        }
        return UITableView.automaticDimension
    }
}

extension MainSlideViewController: CardViewDelegate {
    func clickEvent(indexPath: IndexPath?) {
        if selectedIndexPath != nil && selectedIndexPath?.section == 1 {
            let cellViewModel: DeviceCardViewModel = viewModel.datasource[1].items[selectedIndexPath!.row - 1] as! DeviceCardViewModel
            cellViewModel.view.separateLine.isHidden = cellViewModel.isOpen
            cellViewModel.view.expandView.isHidden = cellViewModel.isOpen
            if (!cellViewModel.isOpen) {
                cellViewModel.isOpen = false
            } else {
                cellViewModel.isOpen = true
            }
        }
        let cellViewModel: DeviceCardViewModel = viewModel.datasource[1].items[indexPath!.row - 1] as! DeviceCardViewModel
        if selectedIndexPath == indexPath {
            cellViewModel.isOpen = false
            selectedIndexPath = nil
            cellViewModel.view.separateLine.isHidden = true
            cellViewModel.view.expandView.isHidden = true
        } else {
            cellViewModel.isOpen = true
            cellViewModel.view.separateLine.isHidden = false
            cellViewModel.view.expandView.isHidden = false
            selectedIndexPath = indexPath
        }
    }
}
