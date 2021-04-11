//
//  UIView+Extensions.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/10/21.
//

import UIKit

extension UIView {
    
    func addShadow(opacity: Float = 0.4, color: UIColor = .darkerGray, width: CGFloat = 0, height: CGFloat = 0, radius: CGFloat = 8) {
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize(width: width, height: height)
        self.layer.shadowColor = color.cgColor
    }
}
