//
//  AppDelegate.swift
//  NestScrollView
//
//  Created by apple on 2023/7/12.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        
        let home = HomeViewController()
        
        let main = BaseNavigationViewController(rootViewController: home)
        
        self.window?.rootViewController = main
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

