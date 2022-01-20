//
//  HeroDetailView.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 20.01.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HeroDetailViewDelegate where Self: UIViewController {
    // Send data back to parent
}

final class HeroDetailView: UIView {
    
    weak var delegate: HeroDetailViewDelegate?
    
    private enum ViewTrait {
        static let leftMargin: CGFloat = 10.0
    }
}
