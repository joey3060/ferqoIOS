//
//  CameraListViewController.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/12/9.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit
import SnapKit

class CameraListViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel:CameraListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CameraCell.self, forCellWithReuseIdentifier: CameraCell.identifier)
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.itemSize = CGSize(width: 170, height: 152)
        }
    }
    
    @IBAction func back(_ sender: Any) {
        viewModel.coordinationDelegate.back()
    }
}

extension CameraListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cameraList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CameraCell.identifier, for: indexPath) as! CameraCell
        let data = viewModel.cameraList[indexPath.row]
        cell.title.text = data.name
        return cell
    }
}

extension CameraListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.coordinationDelegate.goToCameraControlView()
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.3) {
            if let cell = collectionView.cellForItem(at: indexPath) as? CameraCell {
                cell.contentView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.3) {
            if let cell = collectionView.cellForItem(at: indexPath) as? CameraCell {
                cell.contentView.backgroundColor = .clear
            }
        }
    }
}
