//
//  UIImage+Extensions.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/10/21.
//

import UIKit

extension UIImage {
    
    convenience init?(systemName: String, withWeight weight: UIImage.SymbolWeight = .regular) {
        let configuration: UIImage.SymbolConfiguration = UIImage.SymbolConfiguration(weight: weight)
        self.init(systemName: systemName, withConfiguration: configuration)
    }
}
