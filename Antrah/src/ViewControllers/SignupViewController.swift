//
//  SignupViewController.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/5/21.
//

import UIKit

class SignupViewController: UIViewController {
    
    enum Strings: String {
        case title = "Easily gather, track, and manage user feedback"
        case emailPlaceholder = "Email"
        case passwordPlaceholder = "Password"
        case firstNamePlaceholder = "First Name"
        case lastNamePlaceholder = "Last Name"
        case companyPlaceholder = "Company/App Name"
        case signupButtonTitle = "Sign Up"
    }
    
    // MARK: - Subviews
    
    private(set) lazy var scrollView: VerticalScrollStackView = {
        let view = VerticalScrollStackView(
            subviews: [
                titleLabel,
                emailTextField,
                passwordTextField,
                firstNameTextField,
                lastNameTextField,
                companyTextField,
                signupButton
            ]
        )
        view.spacing = 15
        return view
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = .demiBold(ofSize: .titleSmall22px)
        view.backgroundColor = .clear
        view.textColor = .darkGray
        view.numberOfLines = 2
        view.text = Strings.title.rawValue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var emailTextField: UITextField = {
        let view = UITextField()
        view.font = .regular(ofSize: .fontLarge16px)
        view.keyboardType = .namePhonePad
        view.textColor = .darkerGray
        view.autocorrectionType = .no
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1
        view.layer.cornerRadius = .cornerRadiusSmall8px
        view.layer.borderColor = UIColor.primaryBorder.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.sublayerTransform = CATransform3DMakeTranslation(.spacingMicro8px/2, 0, 0);
        view.placeholder = Strings.emailPlaceholder.rawValue
        view.heightAnchor.constraint(equalToConstant: .spacingMacro40px).isActive = true
        return view
    }()
    
    private(set) lazy var passwordTextField: UITextField = {
        let view = UITextField()
        view.font = .regular(ofSize: .fontLarge16px)
        view.isSecureTextEntry = true
        view.textColor = .darkerGray
        view.autocorrectionType = .no
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1
        view.layer.cornerRadius = .cornerRadiusSmall8px
        view.layer.borderColor = UIColor.primaryBorder.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.sublayerTransform = CATransform3DMakeTranslation(.spacingMicro8px/2, 0, 0);
        view.placeholder = Strings.passwordPlaceholder.rawValue
        view.heightAnchor.constraint(equalToConstant: .spacingMacro40px).isActive = true
        return view
    }()
    
    private(set) lazy var firstNameTextField: UITextField = {
        let view = UITextField()
        view.font = .regular(ofSize: .fontLarge16px)
        view.keyboardType = .namePhonePad
        view.textColor = .darkerGray
        view.autocorrectionType = .no
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1
        view.layer.cornerRadius = .cornerRadiusSmall8px
        view.layer.borderColor = UIColor.primaryBorder.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.sublayerTransform = CATransform3DMakeTranslation(.spacingMicro8px/2, 0, 0);
        view.placeholder = Strings.firstNamePlaceholder.rawValue
        view.heightAnchor.constraint(equalToConstant: .spacingMacro40px).isActive = true
        return view
    }()
    
    private(set) lazy var lastNameTextField: UITextField = {
        let view = UITextField()
        view.font = .regular(ofSize: .fontLarge16px)
        view.keyboardType = .namePhonePad
        view.textColor = .darkerGray
        view.autocorrectionType = .no
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1
        view.layer.cornerRadius = .cornerRadiusSmall8px
        view.layer.borderColor = UIColor.primaryBorder.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.sublayerTransform = CATransform3DMakeTranslation(.spacingMicro8px/2, 0, 0);
        view.placeholder = Strings.lastNamePlaceholder.rawValue
        view.heightAnchor.constraint(equalToConstant: .spacingMacro40px).isActive = true
        return view
    }()
    
    private(set) lazy var companyTextField: UITextField = {
        let view = UITextField()
        view.font = .regular(ofSize: .fontLarge16px)
        view.keyboardType = .namePhonePad
        view.textColor = .darkerGray
        view.autocorrectionType = .no
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1
        view.layer.cornerRadius = .cornerRadiusSmall8px
        view.layer.borderColor = UIColor.primaryBorder.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.sublayerTransform = CATransform3DMakeTranslation(.spacingMicro8px/2, 0, 0);
        view.placeholder = Strings.companyPlaceholder.rawValue
        view.heightAnchor.constraint(equalToConstant: .spacingMacro40px).isActive = true
        return view
    }()
    
    private(set) lazy var signupButton: UIButton = { [unowned self] in
        let view = UIButton()
        view.setTitle(Strings.signupButtonTitle.rawValue, for: .normal)
        view.titleLabel?.font = .demiBold(ofSize: .fontMedium14px)
        view.backgroundColor = .red
        view.titleLabel?.textColor = .white
        view.layer.masksToBounds = true
        view.layer.borderWidth = 0
        view.layer.cornerRadius = .cornerRadiusSmall8px
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: .spacingMacro40px).isActive = true
        return view
    }()
    
    // MARK: - Setup
    
    private func setup() {
        view.backgroundColor = .white
        navigationItem.title = "Sign Up"
        
        view.addSubview(scrollView)
        
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .spacingMacro16px).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: .spacingMacro16px).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: CGFloat.spacingMacro16px.negative).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Init
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
