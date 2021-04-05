//
//  UIFont+Extensions.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/3/21.
//

import UIKit

extension UIFont {
    enum FontType: String {
        case light      = "Avenir-Light"
        case regular    = "AvenirNext-Regular"
        case medium     = "AvenirNext-Medium"
        case demiBold   = "AvenirNext-DemiBold"
        case bold       = "AvenirNext-Bold"
        case heavy      = "AvenirNext-Heavy"
    }
    
    convenience init?(type: FontType, size: CGFloat) {
        self.init(name: type.rawValue, size: size)
    }
    
    public static func light(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: UIFont.FontType.light.rawValue, size: size)
    }
    
    public static func regular(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: UIFont.FontType.regular.rawValue, size: size)
    }
    
    public static func medium(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: UIFont.FontType.medium.rawValue, size: size)
    }
    
    public static func demiBold(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: UIFont.FontType.demiBold.rawValue, size: size)
    }
    
    public static func bold(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: UIFont.FontType.bold.rawValue, size: size)
    }
    
    public static func heavy(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: UIFont.FontType.heavy.rawValue, size: size)
    }
}
