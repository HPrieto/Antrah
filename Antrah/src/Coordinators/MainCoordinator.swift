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
    }
    
    // MARK: - Private Properties
    
    private let window: UIWindow?
    
    // MARK: - ViewControllers
    
    private(set) lazy var rootViewController: UITabBarController = {
        let controller = UITabBarController()
        controller.viewControllers = [
            UINavigationController(rootViewController: homeViewController)
        ]
        return controller
    }()
    
    private(set) lazy var homeViewController: UIViewController = { [unowned self] in
        let controller = QuestionFeedViewController()
        controller.view.backgroundColor = .accentGray
        controller.tabBarItem = Tab.tabBarItem(for: .home)
        controller.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                image: UIImage(systemName: "person"),
                style: .plain,
                target: self,
                action: #selector(handleAsk(sender:))
            ),
            UIBarButtonItem(
                image: UIImage(systemName: "square.and.pencil"),
                style: .plain,
                target: self,
                action: #selector(handleAsk(sender:))
            ),
            UIBarButtonItem(
                image: UIImage(systemName: "bell"),
                style: .plain,
                target: self,
                action: #selector(handleNotifications(sender:))
            )
        ]
        return controller
    }()
    
    private(set) lazy var notificationFeedViewController: UIViewController = {
        let controller = NotificationFeedViewController()
        return UINavigationController(rootViewController: controller)
    }()
    
    private(set) lazy var askQuestionViewController: UIViewController = { [unowned self] in
        let controller = AskQuestionViewController()
        controller.askQuestionDelegate = self
        return UINavigationController(rootViewController: controller)
    }()
    
    // MARK: - Handlers
    
    @objc private func handleAsk(sender: UIBarButtonItem) {
        rootViewController.present(
            askQuestionViewController,
            animated: true,
            completion: nil
        )
    }
    
    @objc private func handleNotifications(sender: UIBarButtonItem) {
        rootViewController.present(
            notificationFeedViewController,
            animated: true,
            completion: nil
        )
    }
    
    // MARK: - Public Methods
    
    public func show(_ destination: Destination = .root) {
        
    }
    
    // MARK: - Init
    
    init(window: UIWindow?) {
        self.window = window
        self.window?.rootViewController = rootViewController
    }
}

// MARK: - AskQuestionViewControllerDelegate

extension MainCoordinator: AskQuestionViewControllerDelegate {
    
    func askQuestionViewController(_ controller: AskQuestionViewController, title: String?, body: String) {
        print("Title: \(title ?? "")")
        print("Body: \(body)")
    }
}
