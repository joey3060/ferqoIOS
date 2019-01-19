//
//  Nib.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/17.
//  Copyright © 2018 rae. All rights reserved.
//
import UIKit

//@IBDesignable
extension UIView {
    class func instanceFromNib() -> UIView {
        return UINib(nibName: String(describing: self), bundle: nil).instantiate(withOwner: nil, options: nil).first as! UIView
    }
    
    class func loadNib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
//
////    @IBOutlet var view: UIView!
//    let cornerRadius: CGFloat = 6.0
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        setupView()
//        layoutView()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//
//        setupView()
//        layoutView()
//    }
//
//    func setupView() {
////        let bundle = Bundle(for: type(of: self))
////        UINib(nibName: "MenuItem", bundle: bundle).instantiate(withOwner: self, options: nil)
//
////        addSubview(view)
////        view.frame = bounds
//    }
//
//    func layoutView() {
//    }
//
}
