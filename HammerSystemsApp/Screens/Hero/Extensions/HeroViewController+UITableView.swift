//
//  HeroViewController+UITableView.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 20.01.2022.
//

import Foundation
import UIKit

// MARK: - DataSource
extension HeroViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.heroDisplayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(HeroCell.self, indexPath: indexPath)
        cell.configureCell(self.heroDisplayData[indexPath.row])
        return cell
    }
}

// MARK: - Delegate
extension HeroViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
