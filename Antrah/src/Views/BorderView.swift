//
//  BorderView.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/3/21.
//

import UIKit

class BorderView: UIView {
    
    // MARK: - Setup
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .lighterGray
        heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
