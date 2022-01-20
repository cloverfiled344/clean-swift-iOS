//
//  HeroModel.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 20.01.2022.
//

import UIKit
import ObjectMapper

class HeroModel: Mappable {
    
    var id: Int?
    var name: String?
    var localizedName: String?
    var attackType: String?
    var img: String?
    var icon: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id              <- map["id"]
        name            <- map["name"]
        localizedName   <- map["localized_name"]
        attackType      <- map["attack_type"]
        img             <- map["img"]
        icon            <- map["icon"]
    }
}

