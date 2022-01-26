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
            makeMenuViewController()
        ]
    }
    
    private func makeMenuViewController() -> UINavigationController {
        let nav = UINavigationController(rootViewController: HeroViewController())
        nav.tabBarItem = UITabBarItem(title: "Menu", image: UIImage(named: "menucard"), selectedImage: UIImage(named: "menucard.fill"))
        return nav
    }
}
