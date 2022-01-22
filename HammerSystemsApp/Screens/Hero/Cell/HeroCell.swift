//
//  HeroCell.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 20.01.2022.
//

import Foundation
import UIKit
import SnapKit

class HeroCell: UITableViewCell {
    
    // MARK: UI Components
    private let heroImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let heroName: UILabel = {
        let view = UILabel()
        view.numberOfLines = .zero
        return view
    }()
    
    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure Cell
    func configureCell(_ heroModel: Hero) {
        guard let iconStringURL = heroModel.icon else { return }
        heroImage.load(Constants.mainAPI + iconStringURL)
        heroName.text = heroModel.localizedName
    }
    
    // MARK: - Setup UI methods
    private func setupUI() {
        contentView.addSubview(heroImage)
        contentView.addSubview(heroName)
        
        heroImage.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(8)
            make.height.width.equalTo(44)
            make.bottom.equalToSuperview().offset(-8)
        }
        
        heroName.snp.makeConstraints { make in
            make.top.equalTo(heroImage)
            make.left.equalTo(heroImage.snp.right).offset(8)
            make.bottom.right.equalToSuperview().offset(-8)
        }
    }
}
