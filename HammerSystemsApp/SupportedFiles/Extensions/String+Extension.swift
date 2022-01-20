//
//  String+Extension.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 20.01.2022.
//

import UIKit

extension String {
    
    var encodeUrl: String {
        return self.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? "Empty URL"
    }
    
    var decodeUrl: String {
        return self.removingPercentEncoding ?? "Empty URL"
    }
}
