//
//  MenuItem.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/11.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit

@IBDesignable
class MenuItem: UIView {

    @IBOutlet var view: UIView!
    let cornerRadius: CGFloat = 6.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        layoutView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
        layoutView()
    }
    
    func setupView() {
        let bundle = Bundle(for: type(of: self))
        UINib(nibName: "MenuItem", bundle: bundle).instantiate(withOwner: self, options: nil)
        
        addSubview(view)
        view.frame = bounds
    }
    
    func layoutView() {
    }

}
