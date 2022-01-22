//
//  HeroInteractor.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 20.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

typealias HeroInteractable = HeroBusinessLogic & HeroDataStore

protocol HeroBusinessLogic {
    func fetchHeroes()
}

protocol HeroDataStore {
  
}

final class HeroInteractor {
    
    // MARK: - ExternalProperties
    var presenter: HeroPresentationLogic?
    
    // MARK: - Internal Properties
    private let heroWorker = HeroWorker.init()
}


// MARK: - HeroBusinessLogic
extension HeroInteractor: HeroBusinessLogic {
    
    func fetchHeroes() {
        DispatchQueue.main.async {
            self.heroWorker.getHeroes { [weak self] (object) in
                self?.presenter?.presentFetchResults(response: object)
            }
//            self.heroWorker.getHeroes { [weak self] heroModels in
//                self?.presenter?.presentHeroModels(data: heroModels)
//            }
        }
    }
}


// MARK: - Private Zone
private extension HeroInteractor {
  
}
