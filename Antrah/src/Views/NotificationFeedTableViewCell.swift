//
//  NotificationFeedTableViewCell.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/4/21.
//

import UIKit

class NotificationFeedTableViewCell: UITableViewCell {
    
    enum Dimensions: CGFloat {
        case profileImageViewHeightWidth = 30
    }
    
    // MARK: - Subviews
    
    private(set) lazy var profileImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        view.layer.masksToBounds = true
        view.layer.cornerRadius = .cornerRadiusMedium12px
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var bodyLabel: UILabel = {
        let view = UILabel()
        view.textColor = .gray
        view.font = .medium(ofSize: .fontMedium14px)
        view.backgroundColor = .clear
        view.numberOfLines = 3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var dateLabel: UILabel = {
        let view = UILabel()
        view.textColor = .darkGray
        view.font = .medium(ofSize: .fontExtraSmall10px)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Setup
    
    private func setup() {
        addSubview(profileImageView)
        addSubview(bodyLabel)
        addSubview(dateLabel)
        
        profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: .spacingMicro12px).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: .spacingMacro16px).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: Dimensions.profileImageViewHeightWidth.rawValue).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: Dimensions.profileImageViewHeightWidth.rawValue).isActive = true
        
        dateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: CGFloat.spacingMicro12px.negative).isActive = true
        dateLabel.topAnchor.constraint(equalTo: bodyLabel.topAnchor).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: Dimensions.profileImageViewHeightWidth.rawValue).isActive = true
        
        bodyLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: .spacingMicro8px).isActive = true
        bodyLabel.rightAnchor.constraint(equalTo: dateLabel.leftAnchor, constant: CGFloat.spacingMicro8px.negative).isActive = true
        bodyLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: .spacingMicro4px).isActive = true
        bodyLabel.heightAnchor.constraint(greaterThanOrEqualTo: profileImageView.heightAnchor).isActive = true
        
        bottomAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: .spacingMicro12px).isActive = true
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
