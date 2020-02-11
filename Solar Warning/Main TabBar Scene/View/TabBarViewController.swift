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
        view.backgroundColor = .blue
        
        let controller = MainView()
        controller.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        controller.tabBarItem.accessibilityLabel = "main"
        
        let userView = UserView()
        userView.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
        userView.tabBarItem.accessibilityLabel = "user"
        let controllers = [controller, userView]
        let viewcontrollers = controllers.map {
            UINavigationController(rootViewController: $0)
        }
        viewControllers = viewcontrollers
        title = viewcontrollers.first?.accessibilityLabel
        // Do any additional setup after loading the view.
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        title = item.accessibilityLabel
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
