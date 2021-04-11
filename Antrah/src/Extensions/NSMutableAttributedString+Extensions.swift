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
                     font: UIFont? = UIFont.regular(ofSize: .fontMedium14px),
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
    
    public func addFontAttribute(font: UIFont?) {
        self.addAttribute(
            NSAttributedString.Key.font,
            value: font as Any,
            range: NSRange(location: 0, length: self.length)
        )
    }
    
    public func addColorAttribute(color: UIColor) {
        self.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: color as Any,
            range: NSRange(location: 0, length: self.length)
        )
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
