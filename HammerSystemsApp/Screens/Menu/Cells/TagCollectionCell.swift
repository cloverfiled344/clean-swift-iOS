//
//  TagCollectionCell.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 09.01.2022.
//

import UIKit

class TagCollectionCell: UICollectionViewCell {
    
    // MARK: UI Components
    private let tagButton: UIButton = {
        let view = UIButton()
        view.setTitle("Пицца", for: .normal)
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.layer.borderColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4).cgColor
        view.backgroundColor = .white
        view.setTitleColor(UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4), for: .normal)
        return view
    }()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    // MARK: Setup UI
    private func setupUI() {
        contentView.backgroundColor = .clear
        contentView.addSubview(tagButton)
        tagButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Actions
    func changeStateOfButton() {
        tagButton.setTitleColor(UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1), for: .normal)
        tagButton.backgroundColor = UIColor(red: 253, green: 58, blue: 105, alpha: 0.2)
    }
}
