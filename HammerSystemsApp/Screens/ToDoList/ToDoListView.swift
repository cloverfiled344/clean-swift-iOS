//
//  ToDoListView.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 25.01.2022.
//

import Foundation
import UIKit
import SnapKit

class ToDoListView: UIView {
    
    // MARK: UI Components
    private(set) var tableView: UITableView = {
        let view = UITableView()
        return view
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI methods
    private func setupUI() {
        backgroundColor = .white
        addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(layoutMarginsGuide)
            make.left.right.bottom.equalToSuperview()
        }
    }
}
