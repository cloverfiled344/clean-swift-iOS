//
//  HeroPresenter.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 20.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol HeroPresentationLogic {
    func presentFetchResults(response: HeroModels.Fetch.Response)
//    func presentHeroModels(data: [Hero])
}

final class HeroPresenter {
    
    weak var viewController: HeroDisplayLogic?
    
}

// MARK: - HeroPresentationLogic
extension HeroPresenter: HeroPresentationLogic {
    
    func presentFetchResults(response: HeroModels.Fetch.Response) {
        let viewModel = HeroModels.Fetch.ViewModel.init(heros: response.heros)
        viewController?.displayHeroModels(viewModel)
    }
    
//    func presentHeroModels(data: [Hero]) {
//        viewController?.displayHeroModels(data)
//    }
}


// MARK: - Private Zone
private extension HeroPresenter {
    
    
}
