//
//  HammerSystemsTabBar.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 24.01.2022.
//

import UIKit

class HammerSystemsTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor               = .white
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().tintColor    = .black
        makeTabBars()
    }
    
    private func makeTabBars() {
        viewControllers = [
            makeMenuViewController(),
            makeToDoListViewController(),
            makeTestViewController()
        ]
    }
    
    private func makeMenuViewController() -> UINavigationController {
        let nav = UINavigationController(rootViewController: HeroViewController())
        nav.tabBarItem = UITabBarItem(title: "Menu", image: UIImage(named: "menu"), selectedImage: UIImage(named: "menucard.fill"))
        return nav
    }
    
    private func makeToDoListViewController() -> UINavigationController {
        let nav = UINavigationController(rootViewController: ToDoListViewController())
        nav.tabBarItem = UITabBarItem(title: "ToDoList", image: UIImage(named: "basket"), selectedImage: UIImage(named: "menucard.fill"))
        return nav
    }
    
    private func makeTestViewController() -> UINavigationController {
        let nav = UINavigationController(rootViewController: TestViewController())
        nav.tabBarItem = UITabBarItem(title: "TEST", image: UIImage(named: "menu"), selectedImage: UIImage(named: "menucard.fill"))
        return nav
    }
}
