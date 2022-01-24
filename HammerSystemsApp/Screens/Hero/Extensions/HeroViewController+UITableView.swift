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
        let cell = tableView.dequeueReusableCell(HeroCell.self, indexPath)
        cell.configureCell(self.heroDisplayData[indexPath.row], indexPath.row)
        cell.delegate = self
        return cell
    }
}

// MARK: - Delegate
extension HeroViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
