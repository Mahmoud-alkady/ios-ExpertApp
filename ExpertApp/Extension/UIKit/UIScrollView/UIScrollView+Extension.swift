//
//  UIScrollView+Extension.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 25/08/2022.
//

import UIKit

protocol ScrollableToTop {
    func scrollToTop()
}

extension UIScrollView {
    func scrollToTop(_ animated: Bool) {
        var topContentOffset: CGPoint
        topContentOffset = CGPoint(x: -contentInset.left, y: -contentInset.top)
        setContentOffset(topContentOffset, animated: animated)
    }
}
