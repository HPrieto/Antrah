//
//  HomeViewController.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/11/21.
//

import UIKit

// MARK: - HomeViewControllerDelegate

protocol HomeViewControllerDelegate {
    func homeViewController(_ controller: HomeViewController, signupButtonTapped button: UIButton)
    func homeViewController(_ controller: HomeViewController, googleSignupButtonTapped button: UIButton)
    func homeViewController(_ controller: HomeViewController, termsOfServiceTapped textView: UITextView)
    func homeViewController(_ controller: HomeViewController, privacyPolicyTapped textView: UITextView)
}

// MARK: - HomeViewController

class HomeViewController: UIViewController {
    
    enum Strings: String {
        case title = "Sign up for Antrah"
        case signup = "Use phone or email"
        case google = "Continue with Google"
        case existingAccount = "Already have an account?"
        case login = "Log in"
    }
    
    enum Dimensions: CGFloat {
        case buttonHeight = 36
    }
    
    // MARK: - Public Properties
    
    public var homeDelegate: HomeViewControllerDelegate?
    
    // MARK: - Subviews
    
    private(set) lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = Strings.title.rawValue
        view.font = .demiBold(ofSize: .titleLarge32px)
        view.textAlignment = .center
        view.adjustsFontForContentSizeCategory = true
        view.numberOfLines = 1
        view.textColor = .darkerGray
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var signupButton: UIButton = { [unowned self] in
        let view = UIButton()
        view.backgroundColor = .red
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = .demiBold(ofSize: .fontMedium14px)
        view.setTitle(Strings.signup.rawValue, for: .normal)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = .cornerRadiusSuperTiny2px
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.red.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(
            self,
            action: #selector(handleSignup(sender:)),
            for: .touchUpInside
        )
        return view
    }()
    
    private(set) lazy var googleSignupButton: UIButton = { [unowned self] in
        let view = UIButton()
        view.setTitleColor(.darkerGray, for: .normal)
        view.titleLabel?.font = .demiBold(ofSize: .fontMedium14px)
        view.setTitle(Strings.google.rawValue, for: .normal)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = .cornerRadiusSuperTiny2px
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.primaryBorder.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(
            self,
            action: #selector(handleGoogleSignup(sender:)),
            for: .touchUpInside
        )
        return view
    }()
    
    private(set) lazy var legalTextView: UITextView = { [unowned self] in
        let view = UITextView()
        view.textColor = .gray
        view.backgroundColor = .clear
        view.textAlignment = .center
        view.font = .regular(ofSize: .fontSmall12px)
        view.isScrollEnabled = false
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let termsOfServiceText: NSMutableAttributedString = NSMutableAttributedString(
            string: "Terms of Service"
        )
        termsOfServiceText.addFontAttribute(font: .medium(ofSize: .fontSmall12px))
        termsOfServiceText.addColorAttribute(color: .darkerGray)
        termsOfServiceText.addAttribute(
            NSAttributedString.Key.link,
            value: "",
            range: NSRange(location: 0, length: termsOfServiceText.length)
        )
        
        let privacyPolicyText: NSMutableAttributedString = NSMutableAttributedString(
            string: "Privacy Policy"
        )
        privacyPolicyText.addAttribute(
            NSAttributedString.Key.link,
            value: "",
            range: NSRange(location: 0, length: privacyPolicyText.length)
        )
        privacyPolicyText.addFontAttribute(font: .medium(ofSize: .fontSmall12px))
        privacyPolicyText.addColorAttribute(color: .darkerGray)
        
        view.attributedText = NSMutableAttributedString(
            attributedStrings: [
                NSAttributedString(
                    string: "By signing up, you agree to our ",
                    color: UIColor.gray,
                    font: UIFont.regular(ofSize: .fontSmall12px)
                ),
                termsOfServiceText,
                NSAttributedString(
                    string: " and acknowledge that you have read our ",
                    color: UIColor.gray,
                    font: UIFont.regular(ofSize: .fontSmall12px)
                ),
                privacyPolicyText,
                NSAttributedString(
                    string: " to learn how we collect, use and share your data.",
                    color: UIColor.gray,
                    font: UIFont.regular(ofSize: .fontSmall12px)
                ),
            ]
        )
        view.isEditable = false
        view.isSelectable = true
        view.delegate = self
        return view
    }()
    
    // MARK: - Handlers
    
    @objc private func handleSignup(sender: UIButton) {
        homeDelegate?.homeViewController(self, signupButtonTapped: sender)
    }
    
    @objc private func handleGoogleSignup(sender: UIButton) {
        homeDelegate?.homeViewController(self, googleSignupButtonTapped: sender)
    }
    
    // MARK: - Setup
    
    private func setup() {
        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        view.addSubview(signupButton)
        view.addSubview(googleSignupButton)
        view.addSubview(legalTextView)
        
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .spacingMacro16px).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: .spacingMacro16px).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: CGFloat.spacingMacro16px.negative).isActive = true
        
        signupButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .spacingMicro24px).isActive = true
        signupButton.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        signupButton.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        signupButton.heightAnchor.constraint(equalToConstant: Dimensions.buttonHeight.rawValue).isActive = true
        
        googleSignupButton.topAnchor.constraint(equalTo: signupButton.bottomAnchor, constant: .spacingMicro8px).isActive = true
        googleSignupButton.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        googleSignupButton.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        googleSignupButton.heightAnchor.constraint(equalToConstant: Dimensions.buttonHeight.rawValue).isActive = true
        
        legalTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: CGFloat.spacingMicro12px.negative).isActive = true
        legalTextView.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        legalTextView.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - UITextViewDelegate

extension HomeViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        let interactedText: String = textView.text[characterRange].lowercased().trimmingCharacters(in: .whitespaces)
        
        switch interactedText {
        case "terms of service":
            homeDelegate?.homeViewController(self, termsOfServiceTapped: textView)
        case "privacy policy":
            homeDelegate?.homeViewController(self, privacyPolicyTapped: textView)
        default:
            break
        }
        
        return false
    }
}
