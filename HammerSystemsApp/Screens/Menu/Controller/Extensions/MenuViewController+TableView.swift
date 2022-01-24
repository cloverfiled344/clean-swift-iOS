//
//  MenuViewController+TableView.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 08.01.2022.
//

import UIKit

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return someData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(MenuCell.self, indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = HeroViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
