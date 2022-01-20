//
//  HeroView.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 20.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates(https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template)
//  so you can apply clean architecture to your iOS and MacOS projects,
//  see more http://clean-swift.com
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
        view.backgroundColor = .blue
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