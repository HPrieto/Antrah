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
        case profile
        case settings
        case notifications
    }
    
    // MARK: - Private Properties
    
    private let window: UIWindow?
    
    // MARK: - ViewControllers
    
    private(set) lazy var signupViewController: UIViewController = { [unowned self] in
        let controller = SignupViewController()
        return UINavigationController(rootViewController: controller)
    }()
    
    private(set) lazy var rootNavigationController: UINavigationController = {
        UINavigationController(rootViewController: questionFeedViewController)
    }()
    
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
                systemName: "square.and.pencil",
                weight: .medium,
                target: self,
                action: #selector(handleAsk(sender:))
            ),
            UIBarButtonItem(
                systemName: "bell",
                weight: .medium,
                target: self,
                action: #selector(handleNotifications(sender:))
            )
        ]
        return controller
    }()
    
    private(set) lazy var notificationFeedViewController: UIViewController = {
        let controller = NotificationFeedViewController()
        return controller
    }()
    
    private(set) lazy var askQuestionViewController: UIViewController = { [unowned self] in
        let controller = AskQuestionViewController()
        controller.askQuestionDelegate = self
        return UINavigationController(rootViewController: controller)
    }()
    
    private(set) lazy var profileViewController: UIViewController = { [unowned self] in
        let controller = ProfileViewController()
        return controller
    }()
    
    private(set) lazy var settingsViewController: UIViewController = {
        let controller = SettingsViewController()
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
    
    // MARK: - Public Methods
    
    public func show(_ destination: Destination = .root) {
        switch destination {
        case .profile:
            rootNavigationController.pushViewController(profileViewController, animated: true)
        case .settings:
            rootNavigationController.pushViewController(settingsViewController, animated: true)
        case .notifications:
            rootNavigationController.pushViewController(notificationFeedViewController, animated: true)
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
