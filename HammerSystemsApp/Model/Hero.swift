//
//  Hero.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 20.01.2022.
//

import UIKit
import ObjectMapper

class Hero: Mappable {
    
    var id: Int?
    var name: String?
    var localizedName: String?
    var attackType: String?
    var img: String?
    var icon: String?
    var baseHealth: String?
    var baseAttackMax: String?
    var baseAttackMin: String?
    var roles: [String] = []
    
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
        roles           <- map["roles"]
        baseHealth      <- map["base_health"]
        baseAttackMax   <- map["base_attack_max"]
        baseAttackMin   <- map["base_attack_min"]
    }
}

class HeroWithAsync: Codable {
    
    var id: Int?
    var name: String?
    var localizedName: String?
    var attackType: String?
    var img: String?
    var icon: String?
    var baseHealth: String?
    var baseAttackMax: String?
    var baseAttackMin: String?
    var roles: [String] = []
    
    enum CodingKeys: String, CodingKey {
        case id, name, img, icon, roles
        case localizedName = "localized_name"
        case attackType = "attack_type"
        case baseHealth = "base_health"
        case baseAttackMax = "base_attack_max"
        case baseAttackMin = "base_attack_min"
    }
}

