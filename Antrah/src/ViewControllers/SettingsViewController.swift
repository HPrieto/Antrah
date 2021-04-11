//
//  SettingsViewController.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/10/21.
//

import UIKit

// MARK: - SettingsViewControllerDelegate

protocol SettingsViewControllerDelegate {
    func settingsViewController(_ controller: SettingsViewController, didSelectRowAt indexPath: IndexPath, setting: SettingsViewModel.Setting?)
    func settingsViewController(_ controller: SettingsViewController, logoutButtonTapped button: UIButton)
}

class SettingsViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private(set) var viewModel: SettingsViewModel
    
    // MARK: - Public Properties
    
    public var settingsDelegate: SettingsViewControllerDelegate?
    
    // MARK: - Subviews
    
    private(set) lazy var closeBarButtonItem: UIBarButtonItem = { [unowned self] in
        UIBarButtonItem(
            systemName: "chevron.left",
            weight: .medium,
            target: self,
            action: #selector(handleClose(sender:))
        )
    }()
    
    private(set) lazy var tableView: UITableView = { [unowned self] in
        let view = UITableView(frame: .zero, style: .grouped)
        view.backgroundColor = .systemGroupedBackground
        view.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.reuseIdentifier)
        view.register(ButtonTableViewHeaderFooter.self, forHeaderFooterViewReuseIdentifier: ButtonTableViewHeaderFooter.reuseIdentifier)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    // MARK: - Handlers
    
    @objc private func handleClose(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func handleLogout(sender: UIButton) {
        settingsDelegate?.settingsViewController(self, logoutButtonTapped: sender)
    }
    
    // MARK: - Setup
    
    private func setup() {
        view.backgroundColor = .systemGroupedBackground
        
        navigationItem.leftBarButtonItem = closeBarButtonItem
        navigationItem.title = "Settings"
        
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
        self.viewModel = SettingsViewModel()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UITableViewDelegate

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(inSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseIdentifier, for: indexPath)
        let setting: String = viewModel.settingTitle(at: indexPath)
        cell.textLabel?.text = setting
        cell.textLabel?.font = .medium(ofSize: .fontLarge16px)
        cell.textLabel?.textColor = .darkerGray
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard
            viewModel.isLastSection(section: section)
        else {
            return UIView()
        }
        let footer: ButtonTableViewHeaderFooter = tableView.dequeueReusableHeaderFooterView(withIdentifier: ButtonTableViewHeaderFooter.reuseIdentifier) as! ButtonTableViewHeaderFooter
        footer.buttonTitle = "Log out"
        footer.button.addTarget(self, action: #selector(handleLogout(sender:)), for: .touchUpInside)
        footer.labelText = AppContext.shared.appVersion
        return footer
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        settingsDelegate?.settingsViewController(self, didSelectRowAt: indexPath, setting: viewModel.setting(at: indexPath))
    }
    
}

// MARK: - ViewModel

class SettingsViewModel {
    
    enum Setting {
        case profile
        case questions
        case answered
        case termsOfService
        case privacyPolicy
        
        public static var settings: [[Setting]] = [
            [
                .profile,
                .questions,
                .answered
            ],
            [
                .termsOfService,
                .privacyPolicy
            ]
        ]
        
        public var title: String {
            let title: String
            
            switch self {
            case .profile:
                title = "Profile"
            case .questions:
                title = "Questions"
            case .answered:
                title = "Answered"
            case .termsOfService:
                title = "Terms of Service"
            case .privacyPolicy:
                title = "Privacy Policy"
            }
            
            return title
        }
    }
    
    private(set) var models: [[Setting]]
    
    // MARK: - Public Methods
    
    public func setting(at indexPath: IndexPath) -> Setting? {
        guard
            indexPath.section < models.count,
            indexPath.row < models[indexPath.section].count
        else {
            return nil
        }
        return models[indexPath.section][indexPath.row]
    }
    
    public func settingTitle(at indexPath: IndexPath) -> String {
        guard
            indexPath.section < models.count,
            indexPath.row < models[indexPath.section].count
        else {
            return ""
        }
        return models[indexPath.section][indexPath.row].title
    }
    
    public func numberOfSections() -> Int {
        models.count
    }
    
    public func numberOfRows(inSection section: Int) -> Int {
        guard section < models.count else {
            return 0
        }
        return models[section].count
    }
    
    public func isLastSection(section: Int) -> Bool {
        section == models.count - 1
    }
    
    // MARK: - Init
    
    init() {
        self.models = Setting.settings
    }
}
