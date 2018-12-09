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
    var viewModel:Any!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.register(CameraCell.self, forCellWithReuseIdentifier: CameraCell.identifier)
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.itemSize = CGSize(width: 170, height: 152)
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
    }
}

extension CameraListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CameraCell.identifier, for: indexPath) as! CameraCell
        cell.title.text = "客廳"
        return cell
    }
    
    
}
