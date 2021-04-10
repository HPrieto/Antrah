//
//  NotificationFeedViewController.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/4/21.
//

import UIKit

class NotificationFeedViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let viewModel: NotificationFeedViewModel
    
    // MARK: - Subviews
    
    private(set) lazy var leftBarButtonItem: UIBarButtonItem? = { [unowned self] in
        UIBarButtonItem(
            systemName: "chevron.left",
            weight: .medium,
            target: self,
            action: #selector(handleClose(sender:))
        )
    }()
    
    private(set) lazy var tableView: UITableView = { [unowned self] in
        let view = UITableView()
        view.separatorStyle = .none
        view.delegate = self
        view.dataSource = self
        view.register(NotificationFeedTableViewCell.self, forCellReuseIdentifier: NotificationFeedTableViewCell.reuseIdentifier)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Handlers
    
    @objc private func handleClose(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Setup
    
    private func setup() {
        view.backgroundColor = .white
        
        navigationItem.title = "Notifications"
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Init
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.viewModel = NotificationFeedViewModel(nTestNotifications: 12)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UITableViewDelegate

extension NotificationFeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NotificationFeedTableViewCell = tableView.dequeueReusableCell(withIdentifier: NotificationFeedTableViewCell.reuseIdentifier, for: indexPath) as! NotificationFeedTableViewCell
        let notification: Answer = viewModel.notifications[indexPath.row]
        cell.bodyLabel.attributedText = NSMutableAttributedString(
            attributedStrings: [
                NSAttributedString(
                    string: "Heriberto Prieto",
                    color: .darkerGray,
                    font: UIFont.demiBold(ofSize: .fontMedium14px)
                ),
                NSAttributedString(
                    string: " replied \"\(notification.answer)\"",
                    color: .darkGray,
                    font: UIFont.regular(ofSize: .fontMedium14px)
                )
            ]
        )
        cell.dateLabel.text = "1h ago"
        return cell
    }
}

// MARK: - NotificationFeedViewModel

class NotificationFeedViewModel {
    
    public var notifications: [Answer]
    
    init(notifications: [Answer] = [Answer]()) {
        self.notifications = notifications
    }
    
    init(nTestNotifications n: Int) {
        var test: [Answer] = [Answer]()
        
        for i in 0 ..< n {
            test.append(
                Answer(
                    id: "\(i)-test-notification",
                    questionId: "\(i)",
                    answer: "\(i + 1) Creating a matrix 80x10 with random values from 0 to 99 with no duplicates in the same row with 0 and 99 included in every row",
                    createTime: Date(),
                    creatorId: "\(i)"
                )
            )
        }
        
        self.notifications = test
    }
}
