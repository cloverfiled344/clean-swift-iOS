//
//  MenuBannerView.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 09.01.2022.
//

import UIKit

class MenuBannerView: UIView {
    
    // MARK: UI Components
    private let bannerImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "menu_banner")
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        return view
    }()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    // MARK: Setup UI
    private func setupUI() {
        setConstraints()
    }
    
    private func setConstraints() {
        backgroundColor = .clear
        addSubview(bannerImage)
        bannerImage.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
