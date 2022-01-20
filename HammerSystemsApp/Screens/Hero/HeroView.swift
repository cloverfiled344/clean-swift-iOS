//
//  HeroView.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 20.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SnapKit

protocol HeroViewDelegate where Self: UIViewController {
    // Pass Data to parent view controller
}

final class HeroView: UIView {
    
    // MARK: UI Components
    private(set) var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .white
        return view
    }()
    
    // MARK: Internal properties
    weak var delegate: HeroViewDelegate?
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup UI
    private func setupUI() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(layoutMarginsGuide)
            make.left.right.bottom.equalToSuperview()
        }
    }
}
