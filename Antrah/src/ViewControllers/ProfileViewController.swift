//
//  ProfileViewController.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/5/21.
//

import UIKit

// MARK: - ProfileViewControllerDelegate

protocol ProfileViewControllerDelegate {
    func profileViewController(_ controller: ProfileViewController, addBioButtonTapped button: UIButton)
}

class ProfileViewController: UIViewController {
    
    enum Dimensions: CGFloat {
        case profileImageViewHeightWidth = 80
    }
    
    enum Strings: String {
        case addBioButtonText = "Add a Bio"
    }
    
    // MARK: - Private Properties
    
    private let viewModel: ProfileViewModel
    
    // MARK: - Public Properties
    
    public var profileDelegate: ProfileViewControllerDelegate?
    
    // MARK: - Subviews
    
    private(set) lazy var profileImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        view.layer.masksToBounds = true
        view.layer.cornerRadius = Dimensions.profileImageViewHeightWidth.rawValue / 3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.textColor = .darkerGray
        view.font = .demiBold(ofSize: .fontMedium14px)
        view.numberOfLines = 1
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var usernameLabel: UILabel = {
        let view = UILabel()
        view.textColor = .darkerGray
        view.font = .medium(ofSize: .fontSmall12px)
        view.numberOfLines = 1
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var bioLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 10
        view.backgroundColor = .lightGray
        view.textColor = .darkerGray
        view.font = .medium(ofSize: .fontMedium14px)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var addBioButton: UIButton = { [unowned self] in
        let view = UIButton()
        view.backgroundColor = .clear
        view.titleLabel?.font = .demiBold(ofSize: .fontMedium14px)
        view.setTitleColor(.blue, for: .normal)
        view.setTitle(Strings.addBioButtonText.rawValue, for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(
            self,
            action: #selector(handleAddBioButtonTapped(sender:)),
            for: .touchUpInside
        )
        return view
    }()
    
    // MARK: - Handlers
    
    @objc private func handleAddBioButtonTapped(sender: UIButton) {
        profileDelegate?.profileViewController(self, addBioButtonTapped: sender)
    }
    
    // MARK: - Setup
    
    private func setup() {
        view.backgroundColor = .white
        
        navigationItem.title = "Profile"
        
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(usernameLabel)
        view.addSubview(bioLabel)
        view.addSubview(addBioButton)
        
        profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .spacingMacro16px).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: .spacingMacro16px).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: Dimensions.profileImageViewHeightWidth.rawValue).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: Dimensions.profileImageViewHeightWidth.rawValue).isActive = true
        
        nameLabel.leftAnchor.constraint(equalTo: profileImageView.leftAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: .spacingMicro8px).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: CGFloat.spacingMacro16px.negative).isActive = true
        
        usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: .spacingMicro4px).isActive = true
        usernameLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        usernameLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        
        bioLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: .spacingMicro12px).isActive = true
        bioLabel.leftAnchor.constraint(equalTo: usernameLabel.leftAnchor).isActive = true
        
        addBioButton.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: .spacingMicro12px).isActive = true
        addBioButton.leftAnchor.constraint(equalTo: bioLabel.leftAnchor).isActive = true
        addBioButton.rightAnchor.constraint(equalTo: bioLabel.rightAnchor).isActive = true
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameLabel.text = viewModel.name
        usernameLabel.text = viewModel.username
        bioLabel.text = viewModel.bio
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.viewModel = ProfileViewModel(
            user: User(id: "1", email: "HPrieto@mfour.com", password: "MFourT3st", firstName: "Heriberto", lastName: "Prieto", username: "@HPrieto", phone: "9092512202", bio: "", createTime: Date(), imageUrl: "")
        )
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    init(user: User) {
        self.viewModel = ProfileViewModel(user: user)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ProfileViewModel

class ProfileViewModel {
    
    // MARK: - Public Properties
    
    private(set) var user: User
    
    public var name: String {
        "\(user.firstName) \(user.lastName)"
    }
    
    public var username: String {
        "\(user.username)"
    }
    
    public var bio: String {
        user.bio
    }
    
    init(user: User) {
        self.user = user
    }
}
