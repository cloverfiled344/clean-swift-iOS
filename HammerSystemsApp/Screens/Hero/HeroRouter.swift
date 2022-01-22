//
//  HeroRouter.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 20.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HeroRouting {
    func navigateToHeroDetail(heroDetailModels: [HeroDetail])
}

final class HeroRouter {
    
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
}

// MARK: - HeroRouting
extension HeroRouter: HeroRouting {
    
    func navigateToHeroDetail(heroDetailModels: [HeroDetail]) {
        let vc = HeroDetailViewController()
        vc.router?.dataStore?.heroDetailModels = heroDetailModels
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
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
