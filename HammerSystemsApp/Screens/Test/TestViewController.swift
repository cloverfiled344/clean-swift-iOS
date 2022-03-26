//
//  HammerSystemsApp
//  Copyright (c) 2022 Heads and Hands. All rights reserved.
//


import Foundation
import UIKit
import SnapKit

class TestViewController: UIViewController {
    
    private lazy var textField: UITextField = {
        let view = UITextField()
        view.backgroundColor = .gray
        view.text = "SBCLUB899697"
        view.isUserInteractionEnabled = false
        let iconView = UIImageView(frame: .init(x: 0, y: 5, width: 20, height: 20))
        iconView.image = UIImage(named: "basket")
        let iconContainerView: UIView = UIView(frame: .init(x: 30, y: 0, width: 20, height: 20))
        iconContainerView.addSubview(iconView)
        view.rightView = iconContainerView
        view.rightViewMode = .always
        view.alpha = .zero
        return view
    }()
    
    private let button = UIButton(frame: .init(x: 50, y: 50, width: 120, height: 44))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        button.backgroundColor = .green
        button.setTitle("afjashkf", for: .normal)
        button.addTarget(self, action: #selector(didTapOnButton), for: .touchUpInside)
    }
    
    @objc private func didTapOnButton() {
        UIView.animate(withDuration: 4.0) {
            self.textField.alpha = 1
        } completion: { animate in
            self.textField.alpha = 0
        }
        
//        UIView.animate(withDuration: 1.0, delay: 5.0, options: .allowAnimatedContent) {
//            self.textField.alpha = 1
//        } completion: { finished in
//            if finished {
//                self.textField.alpha = 0
//            }
//        }
    }
    

    
    private func setupUI() {
        view.addSubview(textField)
        view.addSubview(button)
        textField.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(343)
        }
    }
}
