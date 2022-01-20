//
//  MenuViewController+ScrollView.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 10.01.2022.
//

import UIKit

extension MenuViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        setupViewsWithRemake(scrollView)
    }
    
    private func setupViewsWithRemake(_ scrollView: UIScrollView) {
        headerRemakeConstraints(scrollView)
        tagCollectionViewRemakeConstraints(scrollView)
        startAnimateWithRemakeConstaints(scrollView)
    }
    
    private func tagCollectionViewRemakeConstraints(_ scrollView: UIScrollView) {
        tagCollectionView.snp.remakeConstraints { make in
            if scrollView.contentOffset.y > 0 {
                make.top.equalTo(view.layoutMarginsGuide).offset(16)
            } else {
                make.top.equalTo(headerView.snp.bottom).offset(24)
            }
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview()
            make.height.equalTo(36)
        }
    }
    
    private func headerRemakeConstraints(_ scrollView: UIScrollView) {
        if someData.count > 3 {
            headerView.snp.remakeConstraints { make in
                if scrollView.contentOffset.y > 0 {
                    if scrollView.contentOffset.y <= 208 {
                        make.top.equalTo(-scrollView.contentOffset.y)
                    } else {
                        make.top.equalTo(-208)
                    }
                    make.left.right.equalToSuperview()
                } else {
                    make.top.equalTo(view.layoutMarginsGuide).offset(16)
                    make.left.right.equalToSuperview()
                }
                make.height.equalTo(120)
            }
        }
    }
    
    private func startAnimateWithRemakeConstaints(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.5, delay: 0, options: [.allowUserInteraction], animations: {
            self.view.layoutIfNeeded()
            self.headerView.alpha = scrollView.contentOffset.y > 0 ? 0 : 1
        }, completion: nil)
    }
}
