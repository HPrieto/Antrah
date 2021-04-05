//
//  UITableViewCell+Extensions.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/4/21.
//

import UIKit

extension UITableViewCell {
    
    public static var reuseIdentifier: String {
        String(describing: self)
    }
}
