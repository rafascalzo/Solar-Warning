//
//  TabBarViewController.swift
//  Solar Warning
//
//  Created by rafaeldelegate on 11/16/19.
//  Copyright © 2019 rafaeldelegate. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let controller = DashboardView()
        controller.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        controller.tabBarItem.accessibilityLabel = "main"
        
        let userView = UserView()
        userView.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        userView.tabBarItem.accessibilityLabel = "user"
        
        let viewcontrollers = [controller, userView].map {
            let navigation = UINavigationController(rootViewController: $0)
            navigation.isNavigationBarHidden = true
            navigation.navigationBar.isHidden = true
            return navigation
        }
        viewControllers = viewcontrollers
        title = viewcontrollers.first?.accessibilityLabel
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        title = item.accessibilityLabel
    }
}
