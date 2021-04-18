//
//  AnswerTableViewHeader.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/16/21.
//

import UIKit

class QuestionTableViewHeaderFooterView: UITableViewHeaderFooterView {
    
    // MARK: - Subviews
    
    private(set) lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = .demiBold(ofSize: .titleSmall22px)
        view.textColor = .darkerGray
        view.backgroundColor = .clear
        view.numberOfLines = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.font = .demiBold(ofSize: .fontMedium14px)
        view.textColor = .darkGray
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Setup
    
    private func setup() {
        
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: .spacingMicro8px).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: .spacingMacro16px).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: CGFloat.spacingMacro16px.negative).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .spacingMicro4px).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        
        bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: .spacingMicro8px).isActive = true
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
