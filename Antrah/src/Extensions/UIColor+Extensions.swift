//
//  UIColor+Extensions.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/3/21.
//

import UIKit

extension UIColor {
    
    convenience init(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }

    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }

    convenience init(netHex:Int, alpha: CGFloat = 1.0) {
        self.init(
            red:(netHex >> 16) & 0xff,
            green:(netHex >> 8) & 0xff,
            blue:netHex & 0xff,
            alpha: alpha
        )
    }
    
    public static let darkerGray: UIColor = UIColor(netHex: 0x222)
    public static let darkGray: UIColor = UIColor(netHex: 0x717171)
    public static let gray: UIColor = UIColor(netHex: 0xb0b0b0)
    public static let lightGray: UIColor = UIColor(netHex: 0xDDDDDD)
    public static let lighterGray: UIColor = UIColor(netHex: 0xebebeb)
    public static let accentGray: UIColor = UIColor(netHex: 0xf7f7f7)
    
    public static let red: UIColor = UIColor(netHex: 0xff385c)
    public static let orange: UIColor = UIColor(netHex: 0xe07912)
    public static let green: UIColor = UIColor(netHex: 0x008a05)
    public static let blue: UIColor = UIColor(netHex: 0x428bff)
    public static let purple: UIColor = UIColor(netHex: 0x92174d)
    public static let violet: UIColor = UIColor(netHex: 0x460479)
    
    public static let primaryBorder: UIColor = gray
}

/**
 
 --linaria-theme_corner-radius-tiny4px-border-radius: 4px;
     --linaria-theme_corner-radius-small8px-border-radius: 8px;
     --linaria-theme_corner-radius-medium12px-border-radius: 12px;
     --linaria-theme_corner-radius-large16px-border-radius: 16px;
     --linaria-theme_elevation-high-box-shadow: 0 8px 28px rgba(0,0,0,0.28);
     --linaria-theme_elevation-high-border: 1px solid rgba(0,0,0,0.04);
     --linaria-theme_elevation-primary-box-shadow: 0 6px 20px rgba(0,0,0,0.2);
     --linaria-theme_elevation-primary-border: 1px solid rgba(0,0,0,0.04);
     --linaria-theme_elevation-secondary-box-shadow: 0 6px 16px rgba(0,0,0,0.12);
     --linaria-theme_elevation-secondary-border: 1px solid rgba(0,0,0,0.04);
     --linaria-theme_elevation-tertiary-box-shadow: 0 1px 2px rgba(0,0,0,0.18);
     --linaria-theme_elevation-tertiary-border: 1px solid rgba(0,0,0,0.08);
     --linaria-theme_palette-black: #000;
     --linaria-theme_palette-hof: #222;
     --linaria-theme_palette-foggy: #717171;
     --linaria-theme_palette-bobo: #b0b0b0;
     --linaria-theme_palette-deco: #ddd;
     --linaria-theme_palette-bebe: #ebebeb;
     --linaria-theme_palette-faint: #f7f7f7;
     --linaria-theme_palette-white: #fff;
     --linaria-theme_palette-arches: #c13515;
     --linaria-theme_palette-arches2: #b32505;
     --linaria-theme_palette-arches12: #fff8f6;
     --linaria-theme_palette-ondo: #e07912;
     --linaria-theme_palette-spruce: #008a05;
     --linaria-theme_palette-mykonou5: #428bff;
     --linaria-theme_palette-rausch: #ff385c;
     --linaria-theme_palette-plus: #92174d;
     --linaria-theme_palette-luxe: #460479;
     --linaria-theme_palette-rausch-gradient-linear-gradient: linear-gradient(90deg,#bd1e59 0%,#92174d 50%,#861453);
     --linaria-theme_palette-rausch-gradient-radial-gradient: radial-gradient(circle at center,#bd1e59 0%,#92174d 35%,#861453 50%,#6c0d63 100%);
     --linaria-theme_palette-plus-gradient-linear-gradient: linear-gradient(90deg,#bd1e59 0%,#92174d 50%,#861453);
     --linaria-theme_palette-plus-gradient-radial-gradient: radial-gradient(circle at center,#bd1e59 0%,#92174d 35%,#861453 50%,#6c0d63 100%);
     --linaria-theme_palette-luxe-gradient-linear-gradient: linear-gradient(90deg,#59086e 0%,#460479 50%,#440589);
     --linaria-theme_palette-luxe-gradient-radial-gradient: radial-gradient(circle at center,#59086e 0%,#460479 35%,#440589 50%,#3b07bb 100%);
     --linaria-theme_spacing-macro16px: 16px;
     --linaria-theme_spacing-macro24px: 24px;
     --linaria-theme_spacing-macro32px: 32px;
     --linaria-theme_spacing-macro40px: 40px;
     --linaria-theme_spacing-macro48px: 48px;
     --linaria-theme_spacing-macro64px: 64px;
     --linaria-theme_spacing-macro80px: 80px;
     --linaria-theme_spacing-micro2px: 2px;
     --linaria-theme_spacing-micro4px: 4px;
     --linaria-theme_spacing-micro8px: 8px;
     --linaria-theme_spacing-micro12px: 12px;
     --linaria-theme_spacing-micro16px: 16px;
     --linaria-theme_spacing-micro24px: 24px;
     --linaria-theme_spacing-micro32px: 32px;
     --linaria-theme_typography-font-family-cereal-font-family: "Circular",-apple-system,"BlinkMacSystemFont","Roboto","Helvetica Neue",sans-serif;
 
 */
