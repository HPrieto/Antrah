//
//  NSAttributedString+Extensions.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/4/21.
//

import UIKit

extension NSAttributedString {
    
    convenience init?(image: UIImage) {
        let attachment: NSTextAttachment = NSTextAttachment(image: image)
        self.init(attachment: attachment)
    }
    
    convenience init(string: String,
                     color: UIColor = .darkerGray,
                     font: UIFont? = UIFont.regular(ofSize: .fontMedium14px)) {
        let attributedString: NSAttributedString = NSAttributedString(
            string: string,
            attributes: [
                .font: font as Any,
                .foregroundColor: color as Any
            ])
        self.init(attributedString: attributedString)
    }
    
    convenience init(string: String,
                     color: UIColor = .darkerGray,
                     font: UIFont?,
                     fontSize: CGFloat = 12) {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font as Any,
            .foregroundColor: color
        ]
        let attributedString: NSAttributedString = NSAttributedString(
            string: string,
            attributes: attributes)
        self.init(attributedString: attributedString)
    }
}
