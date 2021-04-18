//
//  MainCoordinator.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/3/21.
//

import UIKit

class MainCoordinator {
    
    // MARK: - Tab
    
    enum Tab {
        case home
        
        public var title: String {
            let text: String
            
            switch self {
            case .home:
                text = "Home"
            }
            
            return text
        }
        
        public var image: UIImage? {
            let imageName: String
            
            switch self {
            case .home:
                imageName = "house"
            }
            
            return UIImage(systemName: imageName)
        }
        
        public var tag: Int {
            let tag: Int
            
            switch self {
            case .home:
                tag = 0
            }
            
            return tag
        }
        
        public static func tabBarItem(for tab: Tab) -> UITabBarItem {
            return UITabBarItem(
                title: tab.title,
                image: tab.image,
                tag: tab.tag
            )
        }
    }
    
    // MARK: - Destination
    
    enum Destination {
        case root
        case answers
        case profile
        case settings
        case notifications
        case askQuestion
        case logout
        case signup
    }
    
    // MARK: - Private Properties
    
    private let window: UIWindow?
    
    // MARK: - NavigationControllers
    
    private(set) lazy var rootNavigationController: UINavigationController = {
        NavigationController(rootViewController: questionFeedViewController)
    }()
    
    private(set) lazy var authNavigationController: UINavigationController = {
        NavigationController(rootViewController: homeViewController)
    }()
    
    // MARK: - Auth ViewControllers
    
    private(set) lazy var signupViewController: UIViewController = { [unowned self] in
        let controller = SignupViewController()
        controller.navigationItem.leftBarButtonItem = UIBarButtonItem(
            systemName: "chevron.left",
            weight: .medium,
            target: self,
            action: #selector(handleAuthGoBack(sender:))
        )
        return controller
    }()
    
    // MARK: - ViewControllers
    
    private(set) lazy var questionFeedViewController: UIViewController = { [unowned self] in
        let controller = QuestionFeedViewController()
        controller.view.backgroundColor = .accentGray
        controller.tabBarItem = Tab.tabBarItem(for: .home)
        controller.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                systemName: "gear",
                weight: .medium,
                target: self,
                action: #selector(handleShowSettings(sender:))
            ),
            UIBarButtonItem(
                systemName: "bell",
                weight: .medium,
                target: self,
                action: #selector(handleNotifications(sender:))
            )
        ]
        controller.questionFeedDelegate = self
        return controller
    }()
    
    private(set) lazy var answerFeedViewController: UIViewController = { [unowned self] in
        let controller: AnswerFeedViewController = AnswerFeedViewController()
        return controller
    }()
    
    private(set) lazy var notificationFeedViewController: UIViewController = {
        let controller = NotificationFeedViewController()
        return controller
    }()
    
    private(set) lazy var askQuestionViewController: UIViewController = { [unowned self] in
        let controller = AskQuestionViewController()
        controller.askQuestionDelegate = self
        return NavigationController(rootViewController: controller)
    }()
    
    private(set) lazy var profileViewController: UIViewController = { [unowned self] in
        let controller = ProfileViewController()
        controller.navigationItem.leftBarButtonItem = UIBarButtonItem(
            systemName: "chevron.left",
            weight: .medium,
            target: self,
            action: #selector(handleRootGoBack(sender:))
        )
        return controller
    }()
    
    private(set) lazy var settingsViewController: UIViewController = { [unowned self] in
        let controller = SettingsViewController()
        controller.settingsDelegate = self
        return controller
    }()
    
    private(set) lazy var homeViewController: UIViewController = { [unowned self] in
        let controller = HomeViewController()
        controller.homeDelegate = self
        return controller
    }()
    
    // MARK: - Handlers
    
    @objc private func handleAsk(sender: UIBarButtonItem) {
        questionFeedViewController.present(
            askQuestionViewController,
            animated: true,
            completion: nil
        )
    }
    
    @objc private func handleNotifications(sender: UIBarButtonItem) {
        show(.notifications)
    }
    
    @objc private func handleShowSettings(sender: UIBarButtonItem) {
        show(.settings)
    }
    
    @objc private func handleShowProfile(sender: UIBarButtonItem) {
        show(.profile)
    }
    
    @objc private func handleRootGoBack(sender: UIBarButtonItem) {
        rootNavigationController.popViewController(animated: true)
    }
    
    @objc private func handleAuthGoBack(sender: UIBarButtonItem) {
        authNavigationController.popViewController(animated: true)
    }
    
    // MARK: - Public Methods
    
    public func show(_ destination: Destination = .root) {
        switch destination {
        case .answers:
            rootNavigationController.pushViewController(answerFeedViewController, animated: true)
        case .profile:
            rootNavigationController.pushViewController(profileViewController, animated: true)
        case .settings:
            rootNavigationController.pushViewController(settingsViewController, animated: true)
        case .notifications:
            rootNavigationController.pushViewController(notificationFeedViewController, animated: true)
        case .askQuestion:
            rootNavigationController.present(
                askQuestionViewController,
                animated: true,
                completion: nil
            )
        case .logout:
            authNavigationController.modalPresentationStyle = .fullScreen
            rootNavigationController.present(
                authNavigationController,
                animated: true,
                completion: nil
            )
        case .signup:
            authNavigationController.pushViewController(signupViewController, animated: true)
        default:
            break
        }
    }
    
    // MARK: - Init
    
    init(window: UIWindow?) {
        self.window = window
        self.window?.rootViewController = rootNavigationController
    }
}

// MARK: - AskQuestionViewControllerDelegate

extension MainCoordinator: AskQuestionViewControllerDelegate {
    
    func askQuestionViewController(_ controller: AskQuestionViewController, title: String?, body: String) {
        print("Title: \(title ?? "")")
        print("Body: \(body)")
    }
}

// MARK: - QuestionFeedViewControllerDelegate

extension MainCoordinator: QuestionFeedViewControllerDelegate {
    func questionFeedViewController(_ controller: QuestionFeedViewController, didSelectRowAt indexPath: IndexPath) {
        show(.answers)
    }
    
    func questionFeedViewController(_ controller: QuestionFeedViewController, askQuestionButtonTapped button: UIButton) {
        show(.askQuestion)
    }
}

// MARK: - SettingsViewControllerDelegate

extension MainCoordinator: SettingsViewControllerDelegate {
    
    func settingsViewController(_ controller: SettingsViewController, logoutButtonTapped button: UIButton) {
        show(.logout)
    }
    
    func settingsViewController(_ controller: SettingsViewController, didSelectRowAt indexPath: IndexPath, setting: SettingsViewModel.Setting?) {
        guard let setting: SettingsViewModel.Setting = setting else {
            return
        }
        
        switch setting {
        case .profile:
            show(.profile)
        default:
            break
        }
    }
}

// MARK: - HomeViewControllerDelegate

extension MainCoordinator: HomeViewControllerDelegate {
    
    func homeViewController(_ controller: HomeViewController, signupButtonTapped button: UIButton) {
        show(.signup)
    }
    
    func homeViewController(_ controller: HomeViewController, googleSignupButtonTapped button: UIButton) {
        
    }
    
    func homeViewController(_ controller: HomeViewController, termsOfServiceTapped textView: UITextView) {
        print("Terms of Service Tapped")
    }
    
    func homeViewController(_ controller: HomeViewController, privacyPolicyTapped textView: UITextView) {
        print("Privacy Policy Tapped")
    }
}
