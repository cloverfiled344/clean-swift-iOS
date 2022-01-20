//
//  MenuHeaderCell.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 08.01.2022.
//

import UIKit

// MARK: Appearance
extension MenuHeaderCell {
    
    struct Appearance {
        
    }
}

class MenuHeaderCell: UITableViewHeaderFooterView {

    // MARK: UI Components
    lazy var carouselView = CircularCarousel().then {
        $0.dataSource = self
        $0.delegate = self
    }
    
    // MARK: Init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    // MARK: Setup UI
    private func setupUI() {
        setConstraints()
    }
    
    private func setConstraints() {
        contentView.backgroundColor = .clear
        contentView.addSubview(carouselView)
        carouselView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(-8)
            make.right.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
