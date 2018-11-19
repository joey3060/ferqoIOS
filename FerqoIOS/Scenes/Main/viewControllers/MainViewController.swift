//
//  MainViewController.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/17.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var topBar: UINavigationBar!
    @IBOutlet weak var scrollView: UIScrollView!
    var menu: MenuTableViewController = MenuTableViewController()

    var viewModel: MainViewModel! {
        didSet {
            viewModel.viewDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addMenu()
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        scrollView.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        super.loadView()
        setActionBar()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch! = touches.first
        //location is relative to the current view
        // do something with the touched point
        if touch.view != menu.view && viewModel.menuOpen {
            hideMenu()
        }
    }
    
    @IBAction func clickMenu(_ sender: Any) {
        showMenu()
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer? = nil) {
        if viewModel.menuOpen {
            hideMenu()
        }
    }
    
    func setActionBar() {
        //let pageSetting = viewModel.pageSetting
    }
    
    func showMenu() {
        viewModel.menuOpen = true
        menu.view.snp.updateConstraints{ (make) -> Void in
            make.left.equalToSuperview()
        }
        updateMenu()
    }
    
    func hideMenu() {
        viewModel.menuOpen = false
        menu.view.snp.updateConstraints{ (make) -> Void in
            make.left.equalToSuperview().offset(menu.view.frame.size.width * -1)
        }
        updateMenu()
    }
    
    func updateMenu() {
        self.menu.view.isHidden = false
        view.setNeedsUpdateConstraints()
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        }) { (Bool) in
            self.menu.view.isHidden = !self.viewModel.menuOpen
        }
    }
    
    func addMenu() {
        menu.viewModel = viewModel.coordinationDelegate?.menuTableViewModel
        addChild(menu)
        view.addSubview(menu.view)
        menu.didMove(toParent: self)
        menu.view.snp.makeConstraints{ (make) -> Void in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(menu.view.frame.size.width * -1)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
