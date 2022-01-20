//
//  NetworkLogger.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 20.01.2022.
//

import Foundation
import Alamofire

final class NetworkLogger: EventMonitor {

    let queue = DispatchQueue(label: "networklogger")

    func requestDidFinish(_ request: Request) {
        print(request.description)
    }

    func request<Value>(
        _ request: DataRequest,
        didParseResponse response: DataResponse<Value, AFError>
    ) {
        guard let data = response.data else { return }
        if let json = try? JSONSerialization.jsonObject(with: data,
                                                        options: .mutableContainers) {
            print(json)
        }
    }
}
