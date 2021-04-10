//
//  UIBarButtonItem+Extensions.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/10/21.
//

import UIKit

extension UIBarButtonItem {
    
    convenience init(systemName: String,
                     weight: UIImage.SymbolWeight = .regular,
                     style: UIBarButtonItem.Style = .plain,
                     target: Any?,
                     action: Selector?) {
        let image: UIImage? = UIImage(systemName: systemName, withWeight: weight)
        self.init(
            image: image,
            style: style,
            target: target,
            action: action
        )
    }
}
