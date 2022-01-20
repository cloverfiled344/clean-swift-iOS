//
//  CircularCarousel_Functions.swift
//  CircularCarousel
//
//  Created by Chris Molnar on 10/1/19.
//  Copyright © 2019 Chris Molnar. All rights reserved.
//

import UIKit

extension CircularCarousel {

    internal func minScrollDistance(fromIndex from: Int, toIndex toValue: Int) -> Int {
        // Work out the distance between the two, relative to the whether we are wrapping the carousel
        let directDistance = toValue - from

        if wrapEnabled {
            var wrappedDistance = min(toValue, from) + numberOfItems - max(toValue, from)
            if from < toValue {
                wrappedDistance = -wrappedDistance
            }

            return (abs(directDistance) <= abs(wrappedDistance)) ? directDistance : wrappedDistance
        }

        return directDistance
    }

    internal func minScrollDistance(fromOffset from: CGFloat, toOffset toValue: CGFloat) -> CGFloat {
        let directDistance = toValue - from
        if wrapEnabled {
            var wrappedDistance = min(toValue, from) + CGFloat(numberOfItems) - max(toValue, from)
            if from < toValue {
                wrappedDistance = -wrappedDistance
            }

            return (abs(directDistance) <= abs(wrappedDistance)) ? directDistance : wrappedDistance
        }

        return directDistance
    }

    func reloadItem(atIndex index: Int, animated: Bool) {
        if let containerView = itemView(atIndex: index)?.superview {
            if animated {
                let transition = CATransition.init()
                transition.duration = CircularCarouselConstants.insertDuration
                transition.timingFunction = CAMediaTimingFunction(name:
																	scrollTransitionTimingFunc)
                transition.type = CATransitionType.push
                containerView.layer.add(transition, forKey: nil)
            }

            loadView(atIndex: index, withContainerView: containerView)
        }
    }

    public func scroll(byOffset offset: CGFloat, withDuration duration: TimeInterval) {
        if duration > 0.0 {
            decelerating = false
            scrolling = true

            startTime = CACurrentMediaTime()

            startOffset = scrollOffset
            endOffset = startOffset + offset

            scrollDuration = duration
            if !wrapEnabled {
                endOffset = clampedOffset(endOffset)
            }

            delegate?.carouselWillBeginScrolling(self)
            startAnimation()

        } else {
            scrollOffset += offset
        }
    }

    public func scroll(toOffset offset: CGFloat, withDuration duration: TimeInterval) {
        scroll(byOffset: minScrollDistance(fromOffset: scrollOffset, toOffset: offset), withDuration: duration)
    }

    public func scroll(byNumberOfItems itemCount: Int, withDuration duration: TimeInterval) {
        if duration > 0.0 {
            var offset: CGFloat = 0.0
            if itemCount > 0 {
                offset = (floor(scrollOffset)) + CGFloat(itemCount) - scrollOffset
            } else if itemCount < 0 {
                offset = (ceil(scrollOffset) + CGFloat(itemCount)) - scrollOffset
            } else {
                offset = round(scrollOffset) - scrollOffset
            }

            scroll(byOffset: offset, withDuration: duration)
        } else {
            scrollOffset = CGFloat(clampedIndex(previousItemIndex + itemCount))
        }
    }

    public func scroll(toItemAtIndex index: Int, withDuration duration: TimeInterval) {
        delegate?.carousel(self, willBeginScrollingToIndex: index)
        scroll(toOffset: CGFloat(index), withDuration: duration)
    }

    public func scroll(toItemAtIndex index: Int, animated: Bool) {
        scroll(toItemAtIndex: index, withDuration: animated ? scrollDurationDefault : 0.0)
    }

    public func removeItem(atIndex index: Int, animated: Bool) {
        let removeIndex = clampedIndex(index)
        guard let view = itemView(atIndex: removeIndex) else { return }

        if animated {
            UIView.animate(withDuration: 0.1) {
                view.superview?.layer.opacity = 0.0
            } completion: { (_) in
                self.queue(itemView: view)
            }
            UIView.animate(withDuration: CircularCarouselConstants.insertDuration,
                           delay: 0.1) {
                self.removeViewAtIndex(removeIndex)
                self.numberOfItems -= 1
                self.wrapEnabled = self.value(forOption: CircularCarouselOption.wrap,
                                              withDefaultValue: self.wrapEnabled)
                self.updateNumberOfVisibleItems()
                self.scrollOffset = CGFloat(self.currentItemIdx)
                self.didScroll()
            } completion: { (_) in
                self.depthSortViews()
            }
        } else {
            pushAnimationState(enabled: false)
            queue(itemView: view)
            view.superview?.removeFromSuperview()
            removeViewAtIndex(removeIndex)
            numberOfItems -= 1
            wrapEnabled = value(forOption: CircularCarouselOption.wrap, withDefaultValue: wrapEnabled)
            scrollOffset = CGFloat(currentItemIdx)
            didScroll()
            depthSortViews()
            popAnimationState()
        }
    }

    public func insertItem(atIndex index: Int, _ animated: Bool) {
        numberOfItems += 1
        wrapEnabled = value(forOption: CircularCarouselOption.wrap, withDefaultValue: wrapEnabled)
        updateNumberOfVisibleItems()

        let insert = clampedIndex(index)
        insertView(nil, atIndex: insert)
        loadView(atIndex: insert)

        if abs(itemWidth) < CircularCarouselConstants.floatErrorMargin {
            updateItemWidth()
        }

        if animated {
            UIView.animate(withDuration: CircularCarouselConstants.insertDuration) {
                self.transformItemViews()
            } completion: { (_) in
                self.didScroll()
            }
        } else {
            pushAnimationState(enabled: false)
            didScroll()
            popAnimationState()
        }
        if scrollOffset > 0.0 {
            scroll(toItemAtIndex: 0, animated: animated)
        }
    }
}
