//
//  HeroService.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 20.01.2022.
//

import Foundation
import ObjectMapper

class HeroService {
    
    // MARK: - Internal properties
    private let apiManager = ApiManager.init()
    
    // MARK: Service methods
    func getHeroes(_ completion: @escaping([HeroModel]) -> Void) {
        apiManager.GET(path: Constants.mainAPI + "/api/heroStats") { item in
            guard let heroModels = Mapper<HeroModel>().mapArray(JSONObject: item) else {
                completion([])
                return
            }
            completion(heroModels)
        }
    }
}
