//
//  ApiManager.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 20.01.2022.
//

import UIKit
import Alamofire
import SwiftyJSON

final class ApiManager {
    
    // MARK: - Internal Properties
    private var manager: Session
    
    // MARK: - Private init
    
    init() {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 10
        configuration.allowsConstrainedNetworkAccess = false
        manager = Session(configuration: configuration, eventMonitors: [NetworkLogger()])
    }
    
    // MARK: - Get request
    func GET(path: String, parameters: Parameters? = nil, completion: @escaping(Any) -> Void) {
        manager.request(path.encodeUrl,
                        method: .get,
                        parameters: parameters,
                        encoding: URLEncoding.default).responseJSON { response in
            if let data = response.data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    completion(json)
                }
                catch {
                    completion(JSON.null)
                }
            } else {
                completion(JSON.null)
            }
        }
    }
}
