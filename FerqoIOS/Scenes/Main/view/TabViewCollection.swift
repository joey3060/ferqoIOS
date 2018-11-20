//
//  TabViewCollection.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/20.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

class TabCollectionCell: UICollectionViewCell {
    @IBOutlet weak var textLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class TabViewDataSource: NSObject, UICollectionViewDataSource {
    var tabItems: Array<TabRoomType>!
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TabCollectionCell
        cell.textLabel.text = String(tabItems[indexPath.row].roomName)
        return cell
    }
}

class TabViewDelegate: NSObject, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        Todo: interaction for selected
        print(indexPath.row)
    }
}
