//
//  NavigationController.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/10/21.
//

import UIKit

class NavigationController: UINavigationController {
    
    // MARK: - Public Properties
    
    public var tintColor: UIColor? {
        get {
            navigationBar.tintColor
        }
        set {
            navigationBar.tintColor = newValue
        }
    }
    
    public var textColor: UIColor? {
        didSet {
            navigationBar.titleTextAttributes = [
                NSAttributedString.Key.font: font as Any,
                NSAttributedString.Key.foregroundColor: textColor as Any
            ]
        }
    }
    
    public var font: UIFont? {
        didSet {
            navigationBar.titleTextAttributes = [
                NSAttributedString.Key.font: font as Any,
                NSAttributedString.Key.foregroundColor: textColor as Any
            ]
        }
    }
    
    // MARK: - Setup
    
    private func setup() {
        tintColor = .blue
        textColor = .darkerGray
        font = .demiBold(ofSize: .fontLarge16px)
    }
    
    // MARK: - Init
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
