//
//  SceneDelegate.swift
//  mvgarbuzovPW3
//
//  Created by Matvey Garbuzov on 24.10.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let tabBarController = UITabBarController()
        let viewControllers = [
            StackViewController(),
            TableViewController(),
            CollectionViewController()
        ]
        tabBarController.setViewControllers(viewControllers, animated: false)
        
        let nav = UINavigationController(rootViewController: tabBarController)
        window.rootViewController = nav
        self.window = window
        window.makeKeyAndVisible()
        
        guard let items = tabBarController.tabBar.items else {
            return
        }
        // 123
        let titles = ["Stack", "Table", "Collection"]
        
        for i in 0..<viewControllers.count {
            viewControllers[i].title = titles[i]
            items[i].image = UIImage(named: titles[i]);
            //  Is it correct answer how to use images without an array?
        }
        
        
        
        
//        tabBarController.tabBar.tintColor = .cyan
    }

    

}

