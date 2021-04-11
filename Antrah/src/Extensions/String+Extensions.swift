//
//  String+Extensions.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/11/21.
//

import UIKit

extension String {
    
    subscript(range: NSRange) -> String {
        let startIndex: Index = self.index(self.startIndex, offsetBy: range.lowerBound)
        let endIndex: Index = self.index(self.startIndex, offsetBy: range.upperBound)
        return String(self[startIndex...endIndex])
    }
}
