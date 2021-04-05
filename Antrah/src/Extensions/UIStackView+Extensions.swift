//
//  UIStackView+Extensions.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/3/21.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ subviews: [UIView]) {
        subviews.forEach { [weak self] (arrangedSubview) in
            guard let `self` = self else { return }
            self.addArrangedSubview(arrangedSubview)
        }
    }

    func removeAllArrangedSubviews() {
        self.arrangedSubviews.forEach { [weak self] (subview) in
            guard let `self` = self else { return }
            self.removeArrangedSubview(subview)
        }
    }
}
