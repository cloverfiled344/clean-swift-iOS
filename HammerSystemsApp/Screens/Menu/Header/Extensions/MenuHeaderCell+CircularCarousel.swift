//
//  MenuHeaderCell+CircularCarousel.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 09.01.2022.
//

import UIKit

extension MenuHeaderCell: CircularCarouselDataSource, CircularCarouselDelegate {
    
    func numberOfItems(inCarousel carousel: CircularCarousel) -> Int {
        return 2
    }
    
    func carousel(_: CircularCarousel, viewForItemAt: IndexPath, reuseView: UIView?) -> UIView {
        let frame: CGRect = .init(x: 0,
                                  y: 0,
                                  width: carouselView.frame.size.width - 32.0,
                                  height: carouselView.frame.size.height + 10.0)
        let cell = MenuBannerView(frame: frame)
        return cell
    }
    
    func carousel<CGFloat>(_ carousel: CircularCarousel,
                           valueForOption option: CircularCarouselOption,
                           withDefaultValue defaultValue: CGFloat) -> CGFloat {
        switch option {
        // swiftlint:disable force_cast
        case .itemWidth:
            return (carouselView.frame.width - 40) as! CGFloat
        case .scaleMultiplier:
            return CarouselConstants.scaleMultiplier as! CGFloat
        case .minScale:
            return CarouselConstants.minScale as! CGFloat
        case .maxScale:
            return CarouselConstants.maxScale as! CGFloat
        case .fadeMin:
            return CarouselConstants.minFade as! CGFloat
        case .fadeMax:
            return CarouselConstants.maxFade as! CGFloat
        default:
            return defaultValue
        }
        // swiftlint:enable force_cast
    }
    
    func carousel(_ carousel: CircularCarousel, spacingForOffset offset: CGFloat) -> CGFloat {
        return 0.95
    }
}

struct CarouselConstants {
    static let scaleMultiplier: CGFloat = 0
    static let minScale: CGFloat = 1.0
    static let maxScale: CGFloat = 1.0
    static let minFade: CGFloat = -2.0
    static let maxFade: CGFloat = 2.0
    static let defaultButtonWidth: CGFloat = 120
}
