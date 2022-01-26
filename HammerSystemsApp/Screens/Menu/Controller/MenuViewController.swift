//
//  MenuViewController.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 08.01.2022.
//

import UIKit
import SnapKit

// MARK: Apearance
extension MenuViewController {
    struct Appearance {
        
    }
}

// MARK: - MenuViewController
class MenuViewController: UIViewController {
    
    // MARK: UI Components
    private let tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .gray
        view.separatorColor = .gray
        view.scrollsToTop = true
        view.registerdequeueReusableCell(MenuCell.self)
        return view
    }()
    
    private(set) lazy var tagCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.alwaysBounceHorizontal = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .clear
        view.registerdequeueReusableCell(TagCollectionCell.self)
        return view
    }()
    
    private(set) var headerView: MenuHeaderCell = {
        let view = MenuHeaderCell()
        return view
    }()
    
    private let citySelectBarButtonItem: UIButton = {
        let view = UIButton(frame: .init(x: 0, y: 0, width: 42, height: 42))
        view.setTitle("Moscow", for: .normal)
        view.setImage(UIImage(named: "down_arrow"), for: .normal)
        return view
    }()
    
    // MARK: Mock data
    var someData = ["String", "String", "String", "String", "String", "String", "String", "String"]
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setConstraints()
    }
    
    // MARK: Setup UI
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(headerView)
        view.addSubview(tagCollectionView)
        view.addSubview(tableView)
        
        setupMenuTableView()
        setupTagCollectionView()
        setConstraints()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        setNavigationBarBackColor(title: "",
                                  statusBarBackColor: .white,
                                  navBarBackColor: .white,
                                  navBarTintColor: .white,
                                  prefersLargeTitles: false)
        //        let rightBarButtonItem = UINavigationItem(customView: citySelectBarButtonItem)
        //        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    private func setupMenuTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupTagCollectionView() {
        tagCollectionView.dataSource = self
        tagCollectionView.delegate = self
    }
    
    private func setConstraints() {
        
        headerView.snp.makeConstraints { make in
            make.top.equalTo(view.layoutMarginsGuide).offset(16)
            make.left.right.equalToSuperview()
            make.height.equalTo(120)
        }
        
        tagCollectionView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview()
            make.height.equalTo(36)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(tagCollectionView.snp.bottom).offset(24)
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
    }
}
