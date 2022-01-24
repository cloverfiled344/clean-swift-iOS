//
//  SceneDelegate.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 08.01.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = HammerSystemsTabBar()
        self.window?.makeKeyAndVisible()
    }
}

