//
//  UIViewController+Extension.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 24.01.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setNavigationBarBackColor(title: String, statusBarBackColor: UIColor, navBarBackColor: UIColor, navBarTintColor: UIColor, prefersLargeTitles: Bool) {
        UIApplication.shared.statusBarUIView?.backgroundColor = statusBarBackColor
        navigationController?.navigationBar.backgroundColor = navBarBackColor
        navigationController?.navigationBar.barTintColor = navBarTintColor
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.prefersLargeTitles = prefersLargeTitles
        navigationItem.title = title
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layoutIfNeeded()
    }
}
