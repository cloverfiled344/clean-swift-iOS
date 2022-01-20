//
//  HeroDetailRouter.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 20.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HeroDetailRouting {
    
}

protocol HeroDetailDataPassingDelegate {
    var dataStore: HeroDetailDataStore? { get }
}

final class HeroDetailRouter: HeroDetailDataPassingDelegate {
    
    weak var dataStore: HeroDetailDataStore?
    
}


// MARK: HeroDetailRouting
extension HeroDetailRouter: HeroDetailRouting {
    
}

// MARK: - Private Zone
private extension HeroDetailRouter {
    
   
}
