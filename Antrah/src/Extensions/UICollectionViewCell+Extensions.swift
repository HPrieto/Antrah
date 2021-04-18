//
//  UICollectionViewCell+Extensions.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/16/21.
//

import UIKit

extension UICollectionViewCell {
    
    public static var reuseIdentifier: String {
        String(describing: self)
    }
}
