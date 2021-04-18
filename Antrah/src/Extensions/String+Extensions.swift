//
//  String+Extensions.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/11/21.
//

import UIKit

extension String {
    
    subscript(range: NSRange) -> String {
        let lowerBound: Int = range.lowerBound
        let upperBound: Int = range.upperBound
        guard
            lowerBound >= 0,
            upperBound < self.count
        else {
            return ""
        }
        let startIndex: Index = self.index(self.startIndex, offsetBy: range.lowerBound)
        let endIndex: Index = self.index(self.startIndex, offsetBy: range.upperBound)
        return String(self[startIndex...endIndex])
    }
}
