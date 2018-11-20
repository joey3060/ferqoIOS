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
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var mainSection: UIView!
    @IBOutlet weak var collectionTab: UICollectionView!
    
    let tabDataSource = TabViewDataSource()
    let tabViewDelegate = TabViewDelegate()
    
    var menu: MenuTableViewController = MenuTableViewController()

    var viewModel: MainViewModel! {
        didSet {
            viewModel.viewDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addMenu()
        setMainViewStyle()
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        scrollView.addGestureRecognizer(tap)
        scrollView.delegate = self
        tabDataSource.tabItems = viewModel.tabViewList
        collectionTab.dataSource = tabDataSource
        collectionTab.delegate = tabViewDelegate
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
        let pageSetting = viewModel.pageSetting
        headerTitle.text = pageSetting.name
    }
    
    func setMainViewStyle() {
        let guide = view.safeAreaLayoutGuide
        topBar.backgroundColor = .clear
        topBar.setBackgroundImage(UIImage(), for: .default)
        topBar.shadowImage = UIImage()
        headerTitle.snp.makeConstraints{ (make) -> Void in
            make.top.equalToSuperview().offset(64)
        }
        
        mainSection.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(headerTitle.snp.bottom).offset(23)
            if let window = UIApplication.shared.keyWindow {
                let safeAreaBottom = window.safeAreaInsets.bottom
                let safeAreaTop = window.safeAreaInsets.top
                make.height.size.equalTo(guide.layoutFrame.size.height-safeAreaTop-safeAreaBottom-44)
            }
        }
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
}

extension MainViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let mainTopOffset = scrollView.convert(mainSection.frame.origin, to: nil).y
        let opacity = (mainTopOffset - scrollView.contentOffset.y) / mainTopOffset
        print(opacity)
        headerTitle.textColor = UIColor(white: 1, alpha: opacity)
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item + 1)
    }
}
