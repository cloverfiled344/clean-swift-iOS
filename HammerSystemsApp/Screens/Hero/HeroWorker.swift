//
//  HeroWorker.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 20.01.2022.
//

import Foundation
import ObjectMapper

typealias responseHandler = (HeroModels.Fetch.Response)

class HeroWorker {
    
    // MARK: - Internal properties
    private let apiManager = ApiManager.init()
    
    // MARK: Service methods
    func getHeroes(_ completion: @escaping(responseHandler) -> Void) {
        apiManager.GET(path: Constants.mainAPI + "/api/heroStats") { item in
            guard let heroModels = Mapper<Hero>().mapArray(JSONObject: item) else {
                completion(HeroModels.Fetch.Response(heros: []))
                return
            }
            completion(HeroModels.Fetch.Response(heros: heroModels))
        }
    }
}
