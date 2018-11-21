//
//  TabViewCollection.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/20.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

class TabCollectionCell: UICollectionViewCell {
    @IBOutlet weak var textLabel: UIButton!
    @IBOutlet weak var underLine: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class TabViewDataSource: NSObject, UICollectionViewDataSource {
    var tabItems: Array<TabRoomType>!
    var mainController: MainViewController!
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TabCollectionCell
        if (indexPath.row == 0) {
            cell.underLine.isHidden = false
        }
        cell.textLabel.tag = indexPath.row
        cell.textLabel.addTarget(self, action: #selector(btnEvent), for: .touchUpInside)
        cell.textLabel.setTitle(String(tabItems[indexPath.row].roomName), for: .normal)
        return cell
    }
    
    @objc func btnEvent(_ sender: UIButton!) {
        mainController.scrollSwipeView(sender.tag as Int)
    }
}
