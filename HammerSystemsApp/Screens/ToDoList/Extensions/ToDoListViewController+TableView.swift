//
//  ToDoListViewController+TableView.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 25.01.2022.
//

import UIKit

// MARK: - UITableViewDataSource
extension ToDoListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listItems?.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(UITableViewCell.self, indexPath)
        cell.textLabel?.text = self.listItems?.reversed()[indexPath.row].taskName
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ToDoListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let editingRow = self.listItems?[indexPath.row] else { return .none }
        
        let deleteItem = UIContextualAction(style: .destructive, title: "Delete") { (_,_,_)  in
            try! self.realm.write {
                self.realm.delete(editingRow)
                tableView.reloadData()
            }
        }
        
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteItem])
        return swipeActions
    }
}
