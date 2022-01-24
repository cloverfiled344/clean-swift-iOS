//
//  HeroViewController+HeroCellDelegate.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 23.01.2022.
//

import Foundation

extension HeroViewController: HeroCellDelegate {
    
    func didTapOnMoreInfoButton(_ selectRow: Int) {
        let hero = self.heroDisplayData[selectRow]
        let heroDetail = HeroDetail(image: hero.icon,
                                    description: hero.localizedName,
                                    baseHealth: hero.baseHealth,
                                    baseAttackMax: hero.baseAttackMax,
                                    baseAttackMin: hero.baseAttackMin,
                                    roles: hero.roles)
        router?.navigateToHeroDetail(heroDetailModel: heroDetail)
    }
}
