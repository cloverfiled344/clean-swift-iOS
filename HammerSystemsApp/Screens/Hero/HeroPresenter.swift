//
//  HeroPresenter.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 20.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol HeroPresentationLogic {
    func presentHeroModels(data: [HeroModel])
}

final class HeroPresenter {
    
    weak var viewController: HeroDisplayLogic?
    
}


// MARK: - HeroPresentationLogic
extension HeroPresenter: HeroPresentationLogic {
    
    func presentHeroModels(data: [HeroModel]) {
        viewController?.displayHeroModels(data)
    }
}


// MARK: - Private Zone
private extension HeroPresenter {
    
    
}
