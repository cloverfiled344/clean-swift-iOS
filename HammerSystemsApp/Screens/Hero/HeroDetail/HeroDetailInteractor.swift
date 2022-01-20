//
//  HeroDetailInteractor.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 20.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

typealias HeroDetailInteractable = HeroDetailBusinessLogic & HeroDetailDataStore

protocol HeroDetailBusinessLogic {
    
}

protocol HeroDetailDataStore {
    
}

final class HeroDetailInteractor {
    
    var presenter: HeroDetailPresentationLogic?
    
}

// MARK: - HeroDetailBusinessLogic
extension HeroDetailInteractor: HeroDetailBusinessLogic {
    
}

// MARK: - Private Zone
private extension HeroDetailInteractor {
    
}
