//
//  CircularCarouselDatasource.swift
//  CircularCarousel Demo
//
//  Created by Chris Molnar on 24/12/18.
//  Copyright © 2018 Chris Molnar. All rights reserved.
//

import Foundation
import UIKit

public protocol CircularCarouselDataSource {
    func numberOfItems(inCarousel carousel: CircularCarousel) -> Int
    func carousel(_: CircularCarousel, viewForItemAt: IndexPath, reuseView: UIView?) -> UIView
    func startingItemIndex(inCarousel carousel: CircularCarousel) -> Int
}

public extension CircularCarouselDataSource {
    func startingItemIndex(inCarousel carousel: CircularCarousel) -> Int {
        return 0
    }
}
