//
//  HeroViewController.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 20.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HeroDisplayLogic where Self: UIViewController {
    func displayHeroModels(_ data: [HeroModel])
}

final class HeroViewController: UIViewController {
    
    // MARK: Internal properties
    private var interactor: HeroBusinessLogic?
    private(set) var heroDisplayData = [HeroModel]()
    
    // MARK: UI Components
    private let mainView = HeroView()
    
    // MARK: Init
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Life cycle
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchHeroes()
        setupUI()
    }
    
    // MARK: Internal methods
    private func setup() {
        let viewController = self
        let presenter = HeroPresenter()
        let interactor = HeroInteractor()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
    }
    
    // MARK: Setup UI methods
    private func setupUI() {
        configureTableView()
    }
    
    private func configureTableView() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.registerdequeueReusableCell(HeroCell.self)
    }
}


// MARK: - HeroDisplayLogic
extension HeroViewController: HeroDisplayLogic {
    
    func displayHeroModels(_ data: [HeroModel]) {
        heroDisplayData.removeAll()
        heroDisplayData.append(contentsOf: data)
        let result = Array(heroDisplayData.dropFirst(100))
        heroDisplayData = result
        mainView.tableView.reloadData()
    }
}

// MARK: - HeroViewDelegate
extension HeroViewController: HeroViewDelegate {
    
}
