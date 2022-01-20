//
//  HeroRouter.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 20.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HeroRouting {
    
}

final class HeroRouter {
    
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
}


// MARK: - HeroRouting
extension HeroRouter: HeroRouting {
    
}


// MARK: - Private Zone
private extension HeroRouter {
    
    func dismissHeroScene() {
        viewController?.dismiss(animated: true)
    }
    
    func showXSceneBy(_ data: Int) {
        print("will show the next screen")
    }
}
