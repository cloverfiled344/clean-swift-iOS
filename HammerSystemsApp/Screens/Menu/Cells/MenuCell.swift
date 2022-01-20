//
//  MenuCell.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 08.01.2022.
//

import UIKit

// MARK: Appearance
extension MenuCell {
    struct Appearace {
        
    }
}

// MARK: MenuCell
class MenuCell: UITableViewCell {

    // MARK: UI Components
    private lazy var foodImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "buffalo_pizza")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let descriptionLabel: UILabel = {
        let view = UILabel()
        view.text = "afsashjlfsakhfasfsa"
        view.numberOfLines = .zero
        return view
    }()
    
    private let priceButton: UIButton = {
        let view = UIButton()
        view.setTitle("от 345 р", for: .normal)
        view.layer.cornerRadius = 6.0
        view.layer.borderWidth = 1.0
        view.setTitleColor(UIColor(red: 253, green: 58, blue: 105, alpha: 1), for: .normal)
        view.layer.borderColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1).cgColor
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        return view
    }()
    
    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    // MARK: Setup UI
    private func setupUI() {
        selectionStyle = .none
        contentView.backgroundColor = .white
        contentView.addSubview(foodImage)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(priceButton)
        
        foodImage.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(24)
            make.left.equalToSuperview().offset(16)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(foodImage.snp.top).offset(8)
            make.left.equalTo(foodImage.snp.right).offset(32)
            make.right.equalToSuperview().offset(-24)
        }
        
        priceButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(16)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(32)
            make.bottom.equalToSuperview().offset(-24)
        }
    }
    
    private func setupDescriptionAttribute(_ title: String, _ subtitle: String) {
        let attribute = NSMutableAttributedString(string: title,
                                                  attributes: [.foregroundColor: UIColor(red: 0.133, green: 0.157, blue: 0.192, alpha: 1),
                                                               .font: UIFont.systemFont(ofSize: 17)])
        attribute.append(.init(string: "\n\(subtitle)",
                               attributes: [.foregroundColor: UIColor(red: 0.665, green: 0.668, blue: 0.679, alpha: 1),
                                            .font: UIFont.systemFont(ofSize: 13)]))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
