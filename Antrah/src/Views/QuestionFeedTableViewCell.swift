//
//  QuestionFeedTableViewCell.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/4/21.
//

import UIKit

class QuestionFeedTableViewCell: UITableViewCell {
    
    enum Dimensions: CGFloat {
        case iconHeightWidth = 16
    }
    
    // MARK: - Subviews
    
    private(set) lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .darkerGray
        view.font = .demiBold(ofSize: .fontMedium14px)
        view.backgroundColor = .clear
        view.numberOfLines = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var bodyLabel: UILabel = {
        let view = UILabel()
        view.textColor = .darkGray
        view.font = .regular(ofSize: .fontMedium14px)
        view.backgroundColor = .clear
        view.numberOfLines = 3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var likeButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .clear
        view.tintColor = .lightGray
        view.setImage(
            UIImage(
                systemName: "chevron.up",
                withConfiguration: UIImage.SymbolConfiguration(weight: .bold)
            ),
            for: .normal
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var likeCountLabel: UILabel = {
        let view = UILabel()
        view.textColor = .darkerGray
        view.font = .regular(ofSize: .fontSmall12px)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var replyButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .clear
        view.tintColor = .lightGray
        view.setImage(
            UIImage(
                systemName: "video.bubble.left.fill"
            ),
            for: .normal
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var replyCountLabel: UILabel = {
        let view = UILabel()
        view.textColor = .darkerGray
        view.font = .medium(ofSize: .fontSmall12px)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Setup
    
    private func setup() {
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(titleLabel)
        addSubview(bodyLabel)
        addSubview(likeButton)
        addSubview(likeCountLabel)
        addSubview(replyButton)
        addSubview(replyCountLabel)
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: .spacingMicro12px).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: .spacingMacro16px).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: CGFloat.spacingMacro16px.negative).isActive = true
        
        bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .spacingMicro8px).isActive = true
        bodyLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        bodyLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        
        likeButton.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: .spacingMicro12px).isActive = true
        likeButton.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: Dimensions.iconHeightWidth.rawValue).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: Dimensions.iconHeightWidth.rawValue).isActive = true
        
        likeCountLabel.leftAnchor.constraint(equalTo: likeButton.rightAnchor, constant: .spacingMicro4px).isActive = true
        likeCountLabel.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor).isActive = true
        
        replyButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor).isActive = true
        replyButton.leftAnchor.constraint(equalTo: likeCountLabel.rightAnchor, constant: .spacingMicro12px).isActive = true
        replyButton.heightAnchor.constraint(equalToConstant: Dimensions.iconHeightWidth.rawValue).isActive = true
        replyButton.widthAnchor.constraint(equalToConstant: Dimensions.iconHeightWidth.rawValue).isActive = true
        
        replyCountLabel.leftAnchor.constraint(equalTo: replyButton.rightAnchor, constant: .spacingMicro4px).isActive = true
        replyCountLabel.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor).isActive = true
        
        bottomAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: .spacingMacro16px).isActive = true
    }
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
