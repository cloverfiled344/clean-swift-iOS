//
//  HeroViewController.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 20.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HeroDisplayLogic where Self: UIViewController {
//    func displayHeroModels(_ data: [Hero])
    func displayHeroModels(_ viewModel: HeroModels.Fetch.ViewModel)
}

final class HeroViewController: UIViewController {
    
    // MARK: - External properties
    private(set) var router: HeroRouting?
    private var interactor: HeroBusinessLogic?
    
    // MARK: Internal properties
    private(set) var heroDisplayData = [Hero]()
    
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
        let router = HeroRouter(viewController: viewController)
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        viewController.router = router
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
    
    func displayHeroModels(_ viewModel: HeroModels.Fetch.ViewModel) {
        heroDisplayData.removeAll()
        heroDisplayData.append(contentsOf: viewModel.heros)
        let result = Array(heroDisplayData.dropFirst(100))
        heroDisplayData = result
        mainView.tableView.reloadData()
    }
    
    func displayHeroModels(_ data: [Hero]) {
        
    }
}

// MARK: - HeroViewDelegate
extension HeroViewController: HeroViewDelegate {
    
}
