//
//  AskQuestionViewController.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/3/21.
//

import UIKit

// MARK: - AskQuestionViewControllerDelegate

protocol AskQuestionViewControllerDelegate {
    func askQuestionViewController(_ controller: AskQuestionViewController, title: String?, body: String)
}

// MARK: - AskQuestionViewController

class AskQuestionViewController: UIViewController {
    
    enum Strings: String {
        case title = "Title"
        case titleDescription = "Be specific and imagine you're asking a question to another person."
        case body = "Body"
        case bodyDescription = "Include all the information someone would need to answer your question"
        case submitButtonTitle = "Submit Question"
    }
    
    // MARK: - Private Properties
    
    private var submitButtonBottomConstraint: NSLayoutConstraint?
    
    private var submitButtonBottomConstant: CGFloat = 0 {
        didSet {
            guard let bottomConstraint: NSLayoutConstraint = submitButtonBottomConstraint else {
                return
            }
            bottomConstraint.constant = submitButtonBottomConstant
        }
    }
    
    private let submitButtonBottomConstantMin: CGFloat = .spacingMacro16px
    
    // MARK: - Public Properties
    
    public var askQuestionDelegate: AskQuestionViewControllerDelegate?
    
    // MARK: - Subviews
    
    private(set) lazy var closeBarButtonItem: UIBarButtonItem? = { [unowned self] in
        UIBarButtonItem(
            systemName: "xmark",
            weight: .medium,
            target: self,
            action: #selector(handleClose(sender:))
        )
    }()
    
    private(set) lazy var stackView: VerticalScrollStackView = {
        let view = VerticalScrollStackView(subviews: [
            VerticalScrollStackView.PaddingView(.spacingMicro16px),
            titleLabel,
            titleDescriptionLabel,
            VerticalScrollStackView.PaddingView(.spacingMicro16px),
            titleTextField,
            VerticalScrollStackView.PaddingView(.spacingMicro16px),
            bodyLabel,
            bodyDescriptionLabel,
            VerticalScrollStackView.PaddingView(.spacingMacro16px),
            bodyTextView
        ])
        return view
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = .bold(ofSize: .titleSmall22px)
        label.textColor = .darkerGray
        label.text = Strings.title.rawValue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var titleDescriptionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = .regular(ofSize: .fontMedium14px)
        label.textColor = .darkGray
        label.text = Strings.titleDescription.rawValue
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var titleTextField: UITextField = {
        let view = UITextField()
        view.font = .regular(ofSize: .fontLarge16px)
        view.textColor = .darkerGray
        view.autocorrectionType = .no
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1
        view.layer.cornerRadius = .cornerRadiusSmall8px
        view.layer.borderColor = UIColor.primaryBorder.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.sublayerTransform = CATransform3DMakeTranslation(.spacingMicro8px/2, 0, 0);
        view.heightAnchor.constraint(equalToConstant: .spacingMacro40px).isActive = true
        return view
    }()
    
    private(set) lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = .bold(ofSize: .titleSmall22px)
        label.textColor = .darkerGray
        label.text = Strings.body.rawValue
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var bodyDescriptionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = .regular(ofSize: .fontMedium14px)
        label.textColor = .darkGray
        label.text = Strings.bodyDescription.rawValue
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var bodyTextView: UITextView = {
        let view = UITextView()
        view.textColor = .darkerGray
        view.font = .regular(ofSize: .fontLarge16px)
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1
        view.layer.cornerRadius = .cornerRadiusSmall8px
        view.layer.borderColor = UIColor.primaryBorder.cgColor
        view.sizeToFit()
        view.isScrollEnabled = false
        view.autocorrectionType = .no
        view.heightAnchor.constraint(greaterThanOrEqualToConstant: 120).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var submitButton: UIButton = { [unowned self] in
        let view = UIButton()
        view.setTitle(Strings.submitButtonTitle.rawValue, for: .normal)
        view.titleLabel?.font = .demiBold(ofSize: .fontMedium14px)
        view.backgroundColor = .black
        view.titleLabel?.textColor = .white
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1
        view.layer.cornerRadius = .cornerRadiusSmall8px
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(
            self,
            action: #selector(handleSubmit(sender:)),
            for: .touchUpInside
        )
        return view
    }()
    
    // MARK: - Handlers
    
    @objc private func handleClose(sender: UIBarButtonItem) {
        dismiss(animated: true, completion: { [unowned self] in
            self.reset()
        })
    }
    
    @objc private func handleSubmit(sender: UIButton) {
        askQuestionDelegate?.askQuestionViewController(
            self,
            title: titleTextField.text,
            body: bodyTextView.text
        )
        
        dismiss(animated: true) { [unowned self] in
            self.reset()
        }
    }
    
    // MARK: - Notification
    
    @objc private func handleKeyboardWillShow(notification: Notification) {
        guard let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        let keyboardRectangle: CGRect = keyboardFrame.cgRectValue
        let keyboardHeight: CGFloat = keyboardRectangle.height
        
        DispatchQueue.main.async {
            self.submitButtonBottomConstant = keyboardHeight.negative
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc private func handleKeyboardWillHide(notification: Notification) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.submitButtonBottomConstant = self.submitButtonBottomConstantMin.negative
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    // MARK: - Public Methods
    
    public func reset() {
        titleTextField.text = ""
        bodyTextView.text = ""
        stackView.scrollToTop(animated: false)
    }
    
    // MARK: - Setup
    
    private func setup() {
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = closeBarButtonItem
        
        view.addSubview(stackView)
        view.addSubview(submitButton)
        
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: submitButton.topAnchor, constant: -(.spacingMacro16px)).isActive = true
        
        submitButtonBottomConstraint = submitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -submitButtonBottomConstantMin)
        submitButtonBottomConstraint?.isActive = true
        submitButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: .spacingMacro16px).isActive = true
        submitButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -(.spacingMacro16px)).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: .spacingMacro40px).isActive = true
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleKeyboardWillShow(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleKeyboardWillHide(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
        
        titleTextField.becomeFirstResponder()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        reset()
        
        NotificationCenter.default.removeObserver(self)
    }
}
