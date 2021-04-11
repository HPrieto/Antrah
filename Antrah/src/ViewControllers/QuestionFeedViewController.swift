//
//  QuestionFeedViewController.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/4/21.
//

import UIKit

// MARK: - QuestionFeedViewControllerDelegate

protocol QuestionFeedViewControllerDelegate {
    func questionFeedViewController(_ controller: QuestionFeedViewController, didSelectRowAt indexPath: IndexPath)
    func questionFeedViewController(_ controller: QuestionFeedViewController, askQuestionButtonTapped button: UIButton)
}

class QuestionFeedViewController: UIViewController {
    
    enum Strings: String {
        case askQuestionButtonTitle = "Ask a Question"
    }
    
    enum Dimensions: CGFloat {
        case askButtonHeight = 40
        case askButtonWidth = 140
    }
    
    // MARK: - Public Properties
    
    var questionFeedDelegate: QuestionFeedViewControllerDelegate?
    
    let viewModel: QuestionFeedViewModel
    
    // MARK: - Subviews
    
    private(set) lazy var searchBar: UISearchBar = { [unowned self] in
        let view = UISearchBar()
        view.placeholder = "Search..."
        view.delegate = self
        return view
    }()
    
    private(set) lazy var tableView: UITableView = { [unowned self] in
        let view = UITableView()
        view.separatorInset = .zero
        view.delegate = self
        view.dataSource = self
        view.separatorStyle = .none
        view.register(QuestionFeedTableViewCell.self, forCellReuseIdentifier: QuestionFeedTableViewCell.reuseIdentifier)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentInset = UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: 80,
            right: 0
        )
        return view
    }()
    
    private(set) lazy var askQuestionButton: UIButton = { [unowned self] in
        let view = UIButton()
        view.backgroundColor = .green
        view.titleLabel?.font = .demiBold(ofSize: .fontMedium14px)
        view.setTitleColor(.white, for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(
            self,
            action: #selector(handleAskQuestion(sender:)),
            for: .touchUpInside
        )
        view.setTitle(Strings.askQuestionButtonTitle.rawValue, for: .normal)
        view.addShadow()
        return view
    }()
    
    // MARK: - Handlers
    
    @objc private func handleAskQuestion(sender: UIButton) {
        questionFeedDelegate?.questionFeedViewController(self, askQuestionButtonTapped: sender)
    }
    
    // MARK: - Setup
    
    private func setup() {
        view.backgroundColor = .white
        navigationItem.titleView = searchBar
        
        view.addSubview(tableView)
        view.addSubview(askQuestionButton)
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        askQuestionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: CGFloat.spacingMacro24px.negative).isActive = true
        askQuestionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        askQuestionButton.heightAnchor.constraint(equalToConstant: Dimensions.askButtonHeight.rawValue).isActive = true
        askQuestionButton.layer.masksToBounds = true
        askQuestionButton.layer.cornerRadius = Dimensions.askButtonHeight.rawValue / 2
        askQuestionButton.widthAnchor.constraint(equalToConstant: Dimensions.askButtonWidth.rawValue).isActive = true
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    // MARK: - Init
    
    init() {
        viewModel = QuestionFeedViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        DispatchQueue.main.async { [unowned self] in
            guard
                let touch: UITouch = touches.first,
                !self.searchBar.bounds.contains(touch.location(in: self.searchBar))
            else {
                return
            }
            self.view.endEditing(true)
        }
    }
}

// MARK: - UITableViewDelegate

extension QuestionFeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: QuestionFeedTableViewCell = tableView.dequeueReusableCell(withIdentifier: QuestionFeedTableViewCell.reuseIdentifier, for: indexPath) as! QuestionFeedTableViewCell
        cell.titleLabel.text = "Test Title"
        cell.bodyLabel.text = "Test body text Test body text Test body text Test body text Test body text."
        cell.likeCountLabel.text = "125"
        cell.replyCountLabel.text = "52"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        questionFeedDelegate?.questionFeedViewController(self, didSelectRowAt: indexPath)
    }
}

// MARK: - UISearchBarDelegate

extension QuestionFeedViewController: UISearchBarDelegate {
    
    
}

// MARK: - QuestionFeedViewModel

class QuestionFeedViewModel {
    
    public var questions: [Question]
    
    // MARK: - Init
    
    init(questions: [Question] = [Question]()) {
        self.questions = questions
    }
}
