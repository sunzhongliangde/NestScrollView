//
//  BaseNavigationViewController.swift
//  NestScrollView
//
//  Created by apple on 2023/7/12.
//

import UIKit

class BaseNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.isTranslucent = false

        // Do any additional setup after loading the view.
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.barTintColor = UIColor.white
        navBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
        navBarAppearance.shadowImage = UIImage()
        navBarAppearance.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navBarAppearance.tintColor = UIColor.black
        
        let navBackImage = UIImage.init(named: "navbar_back")
        navBarAppearance.backIndicatorImage = navBackImage
        navBarAppearance.backIndicatorTransitionMaskImage = navBackImage
        
        let barItemAppearance = UIBarButtonItem.appearance()
        barItemAppearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.normal)
        barItemAppearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.highlighted)
        
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.white
            appearance.shadowColor = UIColor.clear
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize:18)]
            appearance.backButtonAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black];
            appearance.backButtonAppearance.highlighted.titleTextAttributes =  [NSAttributedString.Key.foregroundColor: UIColor.black];
            appearance.setBackIndicatorImage(navBackImage, transitionMaskImage: navBackImage)
            
            navBarAppearance.standardAppearance = appearance;
            navBarAppearance.scrollEdgeAppearance = appearance;
        }
        
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        // 当前导航栏, 只有第一个viewController push的时候设置隐藏
        if (self.viewControllers.count == 1) {
            viewController.hidesBottomBarWhenPushed = true
        } else {
            viewController.hidesBottomBarWhenPushed = false
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        if (self.viewControllers.count > 1) {
            let viewController = self.viewControllers.last!
            viewController.hidesBottomBarWhenPushed = true
        }
        super.setViewControllers(viewControllers, animated: animated)
    }

}
