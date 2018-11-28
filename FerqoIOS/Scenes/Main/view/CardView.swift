//
//  CardView.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/27.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

@IBDesignable
class CardView: UITableViewCell {
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        setupView()
//        layoutView()
//    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupView()
        layoutView()
    }

    func setupView() {
        let bundle = Bundle(for: type(of: self))
        UINib(nibName: "CardView", bundle: bundle).instantiate(withOwner: self, options: nil)

        addSubview(view)
        view.frame = bounds
    }

    func layoutView() {
        
    }
    
    @IBAction func clickExpand(_ sender: Any) {
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
