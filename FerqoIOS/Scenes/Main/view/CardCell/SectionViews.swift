//
//  SectionTitle.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/27.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit
import SnapKit

class SectionTitle: UITableViewCell, SlideViewCellType {
    var viewModel: TableViewItemViewModel!
    @IBOutlet weak var title: UILabel!
}


class SectionSituation: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "SituationBtn", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
}


class CardView: UITableViewCell {
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var expandView: UIView!
    @IBOutlet weak var separateLine: UIView!
    
    var viewModel: DeviceCardViewModel! {
        didSet {
            self.viewModel.view = self
        }
    }
    
    var parentDelegate: CardViewDelegate!
    var indexPath: IndexPath!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        separateLine.isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.roundCorners(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 8)
    }
    
    @IBAction func clickExpand(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
//            self.expandView.frame.size = CGSize(width: self.expandView.frame.width, height: CGFloat(self.viewModel.isOpen ? 120 + self.viewModel.height : 0))
//            self.frame.size = CGSize(width: self.frame.width, height: CGFloat(self.totalHeight))
            
            self.parentDelegate.clickEvent(indexPath: self.indexPath)
        }) { (Bool) in
//            self.parentDelegate.clickEvent(indexPath: nil, isOpen: self.open)
        }
    }
}
