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
    func clickEvent(indexPath: IndexPath?, cell: UITableViewCell)
}

class MainSlideViewController: UIViewController {
    var viewModel: MainSlideViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    var situatonCollectionView: UICollectionView!
    
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
        tableView.rowHeight = UITableView.automaticDimension // UITableView.automaticDimension
//        tableView.estimatedRowHeight = 120
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

extension MainSlideViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (viewModel.datasource[0].items[0] as! SituationData).items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SituationButton
        let data = (viewModel.datasource[0].items[0] as! SituationData).items[indexPath.row]
        myCell.title.text = data.title
        myCell.imageView.image = UIImage(named: data.background)
        return myCell
    }
    
    private func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        print("User tapped on item \(indexPath.row)")
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
        if (indexPath.section == 0 && indexPath.row == 1) { // collection view
            if let cell = cell[1] as? SectionSituation {
                cell.backgroundColor = .clear
                cell.collectionView.register(SituationButton.self, forCellWithReuseIdentifier: "cell")
                cell.collectionView.dataSource = self
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
            cell.preservesSuperviewLayoutMargins = false
        }
    }
}

extension MainSlideViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == selectedIndexPath {
            let cellViewModel: DeviceCardViewModel = viewModel.datasource[indexPath.section].items[indexPath.row-1] as! DeviceCardViewModel
            return (cellViewModel.isOpen ? CGFloat(cellViewModel.height + 120) : UITableView.automaticDimension)
        }
        
        if (indexPath.row > 0) {
            return CGFloat(120)
        }
        return UITableView.automaticDimension
    }
}

extension MainSlideViewController: CardViewDelegate {
    func clickEvent(indexPath: IndexPath?, cell: UITableViewCell) {
        if selectedIndexPath != nil && selectedIndexPath?.section == 1 {
            let cellViewModel: DeviceCardViewModel = viewModel.datasource[1].items[selectedIndexPath!.row - 1] as! DeviceCardViewModel
            cellViewModel.view.separateLine.isHidden = cellViewModel.isOpen
            
            if (!cellViewModel.isOpen) {
                cellViewModel.isOpen = false
                cellViewModel.view.expandBtn.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat(CGFloat.pi))
            } else {
                cellViewModel.isOpen = true
                cellViewModel.view.expandBtn.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat(0))
            }
        }
        let cellViewModel: DeviceCardViewModel = viewModel.datasource[1].items[indexPath!.row - 1] as! DeviceCardViewModel
        if selectedIndexPath == indexPath {
            cellViewModel.isOpen = false
            selectedIndexPath = nil
//            cellViewModel.view.separateLine.isHidden = true
//            cellViewModel.view.expandView.isHidden = true
            cellViewModel.view.expandBtn.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat(0))
        } else {
            cellViewModel.isOpen = true
            cellViewModel.view.separateLine.isHidden = false
            selectedIndexPath = indexPath
            cellViewModel.view.expandBtn.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat(CGFloat.pi))
        }
//        cell.setNeedsDisplay()
//        tableView.reloadRows(at: [indexPath!], with: UITableView.RowAnimation.automatic)
    }
}
