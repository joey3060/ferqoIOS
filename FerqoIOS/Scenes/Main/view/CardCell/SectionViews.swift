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
    
    @IBOutlet weak var view: UIView!
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
    weak var parentController: UIViewController!
    var indexPath: IndexPath!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.roundCorners(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 8)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        setUp()
    }
    
    func setUp() {
        separateLine.isHidden = true
        title.text = viewModel.title
        icon.image = UIImage(named: viewModel.icon)
        
        let controller = ProjectorDeviceController()
        expandView.addSubview(controller.view)
        parentController.addChild(controller)
        controller.didMove(toParent: parentController.self)
        controller.view.snp.makeConstraints{
            $0.edges.equalTo(expandView).inset(UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0))
        }
        
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
