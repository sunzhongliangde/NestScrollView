//
//  MainScrollView.swift
//  NestScrollView
//
//  Created by apple on 2023/7/14.
//

import UIKit

class MainScrollView: UIScrollView, UIGestureRecognizerDelegate {

    /// shouldRecognizeSimultaneouslyWith
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        // 子视图，不是 UIScrollView， 不用考虑
        guard let scrollView = gestureRecognizer.view as? UIScrollView else {
            return false
        }
        
        let offsetY = 200.0// + menuViewHeight
        let contentSize = scrollView.contentSize
        let targetRect = CGRect(x: 0,
                                y: offsetY,
                                width: contentSize.width,
                                height: contentSize.height)
        
        let currentPoint = gestureRecognizer.location(in: self)
        // 如果手势，点击在子视图区域
        // 允许子视图区域，独立滚动
        
        // 如果手势，点击在子视图上面的区域
        // 子视图的滚动手势，被屏蔽
        return targetRect.contains(currentPoint)

    }
}
