//
//  UIImageView+Extension.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 20.01.2022.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    
    func load(_ url: String, _ placeholder: UIImage = UIImage()) {
        guard let url = URL(string: url) else {
            self.image = placeholder
            return
        }
        self.sdSetImage(url, placeholder)
    }
    
    private func sdSetImage(_ url: URL, _ placeholder: UIImage) {
        DispatchQueue.main.async {
            self.sd_setImage(with: url, placeholderImage: placeholder, options: .continueInBackground, context: nil)
        }
        
        var name: String {
            return self.image?.accessibilityIdentifier ?? "Unknown"
        }
    }
}
