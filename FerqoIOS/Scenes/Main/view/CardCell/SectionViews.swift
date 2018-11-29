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
    @IBOutlet weak var expandBtn: UIButton!
    
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
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.clipsToBounds = true
        let margins = UIEdgeInsets(top: 0, left: 16, bottom: 10, right: 16)
        contentView.frame = contentView.frame.inset(by: margins)
        self.contentView.layer.borderColor = UIColor(red: 48/255, green: 144/255, blue: 188/255, alpha: 0.56).cgColor
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.cornerRadius = 8
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        setUp()
    }
    
    func setUp() {
        separateLine.isHidden = true
        title.text = viewModel.title
        icon.image = UIImage(named: viewModel.icon)
        
        expandView.addSubview(viewModel.expandController.view)
        parentController.addChild(viewModel.expandController)
        viewModel.expandController.didMove(toParent: parentController.self)
        viewModel.expandController.view.snp.makeConstraints{
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
