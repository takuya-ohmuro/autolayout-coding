//
//  SwipingController+extention.swift
//  AutoLayout5
//
//  Created by takuyaOhmuro on 2018/05/16.
//  Copyright © 2018年 takuyaOhmuro. All rights reserved.
//

import UIKit

extension SwipingController {
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            
            if self.pageControl.currentPage == 0 {
                self.collectionView?.contentOffset = .zero
            }else{
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }) { (_) in
        }
    }
}
extension UIColor {
    static var mainpinkColor = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}
