//
//  ToDoListViewController.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 24.01.2022.
//

import UIKit
import RealmSwift

class ToDoListViewController: UIViewController {
    
    // MARK: - UI Components
    private let mainView = ToDoListView()
    
    // MARK: - Internal properties
    private(set) var realm = try! Realm()
    private(set) var listItems: Results<TaskListModel>? {
        didSet {
            self.mainView.tableView.reloadData()
        }
    }
    
    // MARK: - Life cycle
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()
    }
    
    // MARK: - Fetch data from realm
    private func fetchData() {
        listItems = realm.objects(TaskListModel.self)
    }
    
    // MARK: - Setup UI methods
    private func setupUI() {
        configureNavigationBar()
        configureTableView()
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.backgroundColor = UIColor(displayP3Red: 21/255,
                                                                      green: 101/255,
                                                                      blue: 192/255,
                                                                      alpha: 1)
        navigationItem.rightBarButtonItem = .init(title: "Add item",
                                                  style: .plain,
                                                  target: self,
                                                  action: #selector(addNewItemAction))
    }
    
    private func configureTableView() {
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        mainView.tableView.registerdequeueReusableCell(UITableViewCell.self)
    }
    
    // MARK: - Actions
    @objc private func addNewItemAction() {
        addAlertForNewItem()
    }
    
    private func addAlertForNewItem() {
        let alertController = UIAlertController(title: "New task", message: "Please, fill in the field", preferredStyle: .alert)
        var alertTextField = UITextField()
        alertController.addTextField {
            alertTextField = $0
            $0.placeholder = "New task"
        }
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { action in
            
            guard let text = alertTextField.text, !text.isEmpty else {
                print("The textField is empty, something went wrong!")
                return
            }
            
            let task = TaskListModel(value: ["taskName": text])
            try! self.realm.write {
                self.realm.add(task)
            }
            self.mainView.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
}
