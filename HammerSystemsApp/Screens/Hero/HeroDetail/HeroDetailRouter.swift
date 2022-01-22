//
//  HeroDetailRouter.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 20.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

typealias HeroDetailRoutable = HeroDetailRouting & HeroDetailDataPassingDelegate

protocol HeroDetailRouting {
    
}

protocol HeroDetailDataPassingDelegate {
    var dataStore: HeroDetailDataStore? { get }
}

final class HeroDetailRouter: HeroDetailDataPassingDelegate {
    
    // MARK: - Internal properties
    private weak var viewController: UIViewController?
    weak var dataStore: HeroDetailDataStore?
    
    // MARK: - Init
    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
}

// MARK: - HeroDetailRouting
extension HeroDetailRouter: HeroDetailRouting {
    
}

// MARK: - Private Zone
private extension HeroDetailRouter {
    
}
