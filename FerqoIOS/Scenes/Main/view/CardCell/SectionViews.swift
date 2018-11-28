//
//  SectionTitle.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/27.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

class SectionTitle: UITableViewCell, SlideViewCellType {
    var viewModel: TableViewItemViewModel!
    @IBOutlet weak var title: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}


class SectionSituation: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "SituationBtn", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
}
