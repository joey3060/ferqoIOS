//
//  MainViewController.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/17.
//  Copyright © 2018 rae. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var topBar: UINavigationBar!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var slideContent: UIView!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var mainSection: UIView!
    @IBOutlet weak var collectionTab: UICollectionView!
    @IBOutlet weak var slideWrapper: UIView!
    @IBOutlet weak var slideView: UIScrollView!
    
    let tabDataSource = TabViewDataSource()
    
    var menu: MenuTableViewController = MenuTableViewController()
    var beforeIndex: Int = 0

    var viewModel: MainViewModel! {
        didSet {
            viewModel.viewDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addMenu()
        setMainViewStyle()
        menu.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        scrollView.addGestureRecognizer(tap)
        scrollView.delegate = self
        slideView.delegate = self
        tabDataSource.tabItems = viewModel.tabViewList
        collectionTab.dataSource = tabDataSource
        collectionTab.delegate = self
        collectionTab.isUserInteractionEnabled = true
        tabDataSource.mainController = self
        setupSlides()
        setupSlideScrollView(slides: viewModel.tabViewList)
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
        slideContent.layer.shadowOffset = CGSize(width: 0,height: -10)
        slideContent.layer.shadowOpacity = 0.7
        slideContent.layer.shadowRadius = 10
        slideContent.layer.shadowColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        topBar.backgroundColor = .clear
        topBar.setBackgroundImage(UIImage(), for: .default)
        topBar.shadowImage = UIImage()
        headerTitle.snp.makeConstraints{ (make) -> Void in
            make.top.equalToSuperview().offset(64)
        }
        
        mainSection.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(headerTitle.snp.bottom).offset(23)
            make.left.right.equalToSuperview()
            if let window = UIApplication.shared.keyWindow {
                let safeAreaBottom = window.safeAreaInsets.bottom
                let safeAreaTop = window.safeAreaInsets.top
                make.height.size.equalTo(guide.layoutFrame.size.height-safeAreaTop-safeAreaBottom-topBar.frame.height+5)
            }
        }
        slideWrapper.snp.makeConstraints {
            $0.width.equalTo(view).priority(1000)
        }
    }
    
    func setupSlides() {
        for i in 0 ..< viewModel.tabViewList.count {
            let newSlideView = viewModel.coordinationDelegate?.mainSlideViewController
            newSlideView?.viewModel.setRoomType(name: viewModel.tabViewList[i].roomName)
            viewModel.tabViewList[i].viewController = newSlideView
        }
    }
    
    func setupSlideScrollView(slides : [TabRoomType]) {
//        slideView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - topBar.frame.height - collectionTab.frame.height) // mainSection.frame.height - collectionTab.frame.height
        slideView.snp.makeConstraints {
            $0.width.equalTo(view).priority(1000)
            $0.height.equalTo(view).offset(-(topBar.frame.height + collectionTab.frame.height)).priority(1000)
        }
        slideView.layoutIfNeeded()
        slideView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height - topBar.frame.height - collectionTab.frame.height)
        slideView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].viewController!.view.frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: slideView.frame.height)
//            slides[i].viewController!.view.roundCorners(corners: [.topLeft, .topRight], radius: 8)
            addChild(slides[i].viewController!)
            slideView.addSubview(slides[i].viewController!.view)
            slides[i].viewController!.didMove(toParent: self)
        }
    }
    
    func scrollSwipeView(_ index: Int) {
        let width = CGFloat(slideView.frame.width)
        UIView.animate(withDuration: 0.4, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.slideView.contentOffset.x = width * CGFloat(index)
        }, completion: nil)
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
    
    func disableScrollView() {
        viewModel.tabViewList[beforeIndex].viewController?.tableView.isScrollEnabled = false
    }
    
    func enableScrollView() {
        viewModel.tabViewList[beforeIndex].viewController?.tableView.isScrollEnabled = true
    }
}

extension MainViewController: MenuDelegate {
    func selectOnMenu(data: MenuItemType) {
        if data.icon == "sensor" {
            viewModel.coordinationDelegate?.goToSensorView()
        }
        
        if data.icon == "filled" {
            viewModel.coordinationDelegate?.goToSensorDetectView()
        }
        
        if data.icon == "mic" {
            viewModel.coordinationDelegate?.goToInterPhoneView()
        }
        
        if data.icon == "alert2" {
            viewModel.coordinationDelegate?.goToAlarmView()
        }

        if data.icon == "alarm" {
            viewModel.coordinationDelegate?.goToCameraListView()
        }
    }
}

extension MainViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (self.scrollView == scrollView) {
            let mainTopOffset = scrollView.convert(mainSection.frame.origin, to: nil).y
            let opacity = (mainTopOffset - scrollView.contentOffset.y) / mainTopOffset
            headerTitle.textColor = UIColor(white: 1, alpha: opacity)
            if (opacity < 0) {
                enableScrollView()
            } else {
                disableScrollView()
            }
        } else if(slideView == scrollView) {
            let beforeCell = collectionTab.cellForItem(at: IndexPath(item: beforeIndex, section: 0)) as! TabCollectionCell
            beforeCell.underLine.isHidden = true
            let index = lround(Double(scrollView.contentOffset.x / slideView.frame.width))
            collectionTab.scrollToItem(at: IndexPath(item: index, section: 0), at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
            let cell = collectionTab.cellForItem(at: IndexPath(item: index, section: 0)) as! TabCollectionCell
            cell.underLine.isHidden = false
            beforeIndex = index
        }
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item + 1)
    }
}
