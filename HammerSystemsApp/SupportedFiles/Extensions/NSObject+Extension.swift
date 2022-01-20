//
//  NSObject+Extension.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 09.01.2022.
//

import UIKit

extension NSObject {
    func overrides(_ selector: Selector) -> Bool {
        var currentClass: AnyClass = type(of: self)
        let method: Method? = class_getInstanceMethod(currentClass, selector)

        while let superClass: AnyClass = class_getSuperclass(currentClass) {
            if class_getInstanceMethod(superClass, selector).map({ $0 != method}) ?? false { return true }
            currentClass = superClass
        }

        return false
    }
}

