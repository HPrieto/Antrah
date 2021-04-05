//
//  QuestionFeedViewController.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/4/21.
//

import UIKit

class QuestionFeedViewController: UIViewController {
    
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
        return view
    }()
    
    // MARK: - Setup
    
    private func setup() {
        view.backgroundColor = .white
        navigationItem.titleView = searchBar
        
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
