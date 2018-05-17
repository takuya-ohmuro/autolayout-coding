//
//  SwipingController.swift
//  AutoLayout5
//
//  Created by takuyaOhmuro on 2018/05/16.
//  Copyright © 2018年 takuyaOhmuro. All rights reserved.
//

import UIKit


class SwipingController: UICollectionViewController,UICollectionViewDelegateFlowLayout{
    
    let pages = [
        Page(imageName: "bear_first", headerString:"Join us today in our fun and games", bodyString:"Are you ready for loads and loads of fun? Dont`t wait any longer ! we hope to see you in our store"),
        Page(imageName: "heart_second", headerString:"Subscribe and get coupons on our daily events", bodyString: "Get notified of the sayvings wwwwwiwiowlw wkwlwlwlwlw"),
        Page(imageName: "leaf_third", headerString:"VIP members special services", bodyString: "konnnitiha sayounara mataa asitayoroskuonegaisimasu")
    ]
    
    private let prevButton:UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.setTitle("PREV", for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    @objc private func handlePrev() {
        print("Prev")
        let nextPage = max(pageControl.currentPage - 1,0)
        let indexPath = IndexPath(item: nextPage, section: 0)
        pageControl.currentPage = nextPage
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private let nextButton:UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.setTitle("NEXT", for: .normal)
        button.setTitleColor(.mainpinkColor, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    @objc private func handleNext() {
        print("next")
        let nextPage = min(pageControl.currentPage + 1,pages.count - 1)
        let indexPath = IndexPath(item: nextPage, section: 0)
        pageControl.currentPage = nextPage
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    lazy var pageControl:UIPageControl = {
        let pc = UIPageControl()
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        pc.currentPageIndicatorTintColor = .mainpinkColor
        return pc
    }()

    fileprivate func setupButton() {
        let buttomStackView = UIStackView(arrangedSubviews: [prevButton,pageControl,nextButton])
        buttomStackView.translatesAutoresizingMaskIntoConstraints = false
        buttomStackView.distribution = .fillEqually
        view.addSubview(buttomStackView)
        
        NSLayoutConstraint.activate([
            buttomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttomStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttomStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            buttomStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
         setupButton()
        collectionView?.backgroundColor = .white
        collectionView?.isPagingEnabled = true
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
    }
    
    
}
