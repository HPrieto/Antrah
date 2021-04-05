//
//  VerticalScrollStackView.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/3/21.
//

import UIKit

class VerticalScrollStackView: UIScrollView {
    
    // MARK: - Padding
    
    class PaddingView: UIView {
        
        private let padding: CGFloat
        
        // MARK: - Setup
        
        private func setup() {
            translatesAutoresizingMaskIntoConstraints = false
            backgroundColor = .clear
            
            heightAnchor.constraint(equalToConstant: padding).isActive = true
        }
        
        // MARK: - Init
        
        init(_ padding: CGFloat) {
            self.padding = padding
            super.init(frame: .zero)
            setup()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    // MARK: - Public Properties
    
    public var spacing: CGFloat = 0 {
        didSet {
            stackView.spacing = spacing
        }
    }
    
    // MARK: - Subviews
    
    private(set) lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Public Methods
    
    public func scrollToTop(animated: Bool = true) {
        self.setContentOffset(CGPoint(x: 0, y: 0), animated: animated)
    }
    
    // MARK: - Setup
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: widthAnchor, constant: -(.spacingMacro16px * 2.0)).isActive = true
    }
    
    // MARK: - Init
    
    init(subviews: [UIView] = [UIView]()) {
        super.init(frame: .zero)
        setup()
        self.stackView.addArrangedSubviews(subviews)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
