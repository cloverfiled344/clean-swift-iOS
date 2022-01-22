//
//  HeroDetailViewController.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 20.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HeroDetailDisplayLogic where Self: UIViewController {
    
}

final class HeroDetailViewController: UIViewController {
    
    // MARK: - Internal properties
    private var interactor: HeroDetailInteractable?
    private(set) var router: HeroDetailRoutable?
//    private(set) var displayData: [Any] = []
    
    // MARK: - UI Components
    private let mainView = HeroDetailView()
    
    // MARK: - Init
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
        //interactor.doSomething(item: 22)
        setupUI()
    }
    
    // MARK: - Internal methods
    private func setup() {
        let viewController = self
        let presenter = HeroDetailPresenter()
        let interactor = HeroDetailInteractor()
        let router = HeroDetailRouter(viewController: viewController)
        router.dataStore = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        viewController.router = router
    }
    
    // MARK: - Setup UI methods
    private func setupUI() {
        
    }
}

// MARK: - HeroDetailDisplayLogic
extension HeroDetailViewController: HeroDetailDisplayLogic {
    
}

// MARK: - HeroDetailViewDelegate
extension HeroDetailViewController: HeroDetailViewDelegate {
    
    func sendDataBackToParent(_ data: Data) {
        //usually this delegate takes care of users actions and requests through UI
        
        //do something with the data or message send back from mainView
    }
}

// MARK: - Private Zone
private extension HeroDetailViewController {

}
