//
//  ButtonTableViewFooter.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/10/21.
//

import UIKit

class ButtonTableViewHeaderFooter: UITableViewHeaderFooterView {
    
    // MARK: - Public Properties
    
    public var buttonTitle: String? {
        get {
            button.titleLabel?.text
        }
        set {
            button.setTitle(newValue, for: .normal)
        }
    }
    
    public var labelText: String? {
        get {
            label.text
        }
        set {
            label.text = newValue
        }
    }
    
    // MARK: - Subviews
    
    private(set) lazy var button: UIButton = {
        let view = UIButton()
        view.backgroundColor = .red
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = .demiBold(ofSize: .fontMedium14px)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = .cornerRadiusTiny4px
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var label: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.textColor = .gray
        view.font = .medium(ofSize: .fontMedium14px)
        view.numberOfLines = 1
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Setup
    
    private func setup() {
        addSubview(button)
        addSubview(label)
        
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.topAnchor.constraint(equalTo: topAnchor, constant: .spacingMacro24px).isActive = true
        button.leftAnchor.constraint(equalTo: leftAnchor, constant: .spacingMacro16px).isActive = true
        button.rightAnchor.constraint(equalTo: rightAnchor, constant: CGFloat.spacingMacro16px.negative).isActive = true
        
        label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: .spacingMacro24px).isActive = true
        label.leftAnchor.constraint(equalTo: button.leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: button.rightAnchor).isActive = true
        
        bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: .spacingMacro16px).isActive = true
    }
    
    // MARK: - Init
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
