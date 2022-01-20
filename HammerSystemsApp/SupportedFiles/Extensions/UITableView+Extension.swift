//
//  UITableView+Extension.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 09.01.2022.
//

import UIKit

extension UITableView {
    
    func registerdequeueReusableCell<T: UITableViewCell>(_ cellType: T.Type) {
        let className = String(describing: cellType)
        let identifier = className + "ID"
        register(cellType, forCellReuseIdentifier: identifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_ cellType: T.Type,
                                                 indexPath: IndexPath) -> T {
        let className = String(describing: cellType)
        let identifier = className + "ID"
        return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
        
    }
    
    func registerdequeueReusableHeaderFooter<T: UITableViewHeaderFooterView>(_ cellType: T.Type) {
        let className = String(describing: cellType)
        let identifier = className + "ID"
        register(cellType, forHeaderFooterViewReuseIdentifier: identifier)
    }
    
    func dequeueReusableHeaderFooter<T: UITableViewHeaderFooterView>(_ cellType: T.Type) -> T {
        let className = String(describing: cellType)
        let identifier = className + "ID"
        return dequeueReusableHeaderFooterView(withIdentifier: identifier) as! T
    }
    
}
