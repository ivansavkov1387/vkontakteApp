//
//  TabBarController.swift
//  vkontakteApp
//
//  Created by Иван on 11/23/21.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        
        setupVCs()
    }
    
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: FriendsViewController(),
                                title: "Friends",
                                image: UIImage(systemName: "magnifyingglass")!),
            createNavController(for: PublicsViewController(),
                                title: "Publics",
                                image: UIImage(systemName: "house")!),
        ]
        
    }
    
}
