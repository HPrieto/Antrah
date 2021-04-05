//
//  NSMutableAttributedString+Extensions.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/4/21.
//

import UIKit

extension NSMutableAttributedString {
    
    convenience init(string: String,
                     color: UIColor = .darkerGray,
                     font: UIFont,
                     underlineStyle: NSUnderlineStyle? = nil,
                     underlineColor: UIColor = .black) {
        var attributes: [NSAttributedString.Key: Any] = [
            .font: font as Any,
            .foregroundColor: color
        ]
        if let underlineStyle = underlineStyle {
            attributes[NSAttributedString.Key.underlineStyle] = underlineStyle
            attributes[NSAttributedString.Key.underlineColor] = underlineColor
        }
        let attributedString: NSAttributedString = NSAttributedString(
            string: string,
            attributes: attributes)
        self.init(attributedString: attributedString)
    }
    
    public func append(attributedStrings: [NSAttributedString]) {
        attributedStrings.forEach { [unowned self] (attrString) in
            self.append(attrString)
        }
    }
    
    convenience init(attributedStrings: [NSAttributedString]) {
        self.init(string: "")
        attributedStrings.forEach { [unowned self] (attrString) in
            self.append(attrString)
        }
    }
}
