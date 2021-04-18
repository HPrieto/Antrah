//
//  AnswerFeedViewController.swift
//  Antrah
//
//  Created by Heriberto Prieto on 4/16/21.
//

import UIKit

class AnswerFeedViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let viewModel: AnswerFeedViewModel
    
    // MARK: - Subviews
    
    private(set) lazy var backBarButtonItem: UIBarButtonItem = {
        UIBarButtonItem(
            systemName: "chevron.left",
            weight: .medium,
            target: self,
            action: #selector(handleGoBack(sender:))
        )
    }()
    
    private(set) lazy var navbar: UINavigationBar = {
        let view = UINavigationBar()
        view.items = [navItem]
        view.tintColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var navItem: UINavigationItem = {
        let view = UINavigationItem()
        view.leftBarButtonItem = backBarButtonItem
        return view
    }()
    
    private(set) lazy var collectionView: UICollectionView = { [unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.headerReferenceSize = .zero
        let view = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self
        view.isPagingEnabled = true
        view.backgroundColor = .lightGray
        view.contentInsetAdjustmentBehavior = .never
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.reuseIdentifier)
        return view
    }()
    
    // MARK: - Handlers
    
    @objc private func handleGoBack(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Setup
    
    private func setup() {
        view.backgroundColor = .lightGray
        
        view.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - Init
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.viewModel = AnswerFeedViewModel(
            question: Question(
                id: "1",
                title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                body: "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                createTime: Date(),
                creatorId: "1"
            )
        )
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UICollectionViewDelegate

extension AnswerFeedViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItemsInSection(section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.reuseIdentifier, for: indexPath)
        cell.backgroundColor = indexPath.row % 2 == 0 ? .blue : .orange
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        .zero
    }
    
}

// MARK: - AnswerFeedViewModel

class AnswerFeedViewModel {
    
    // MARK: - Public Properties
    
    private(set) var question: Question
    
    // MARK: - Public Methods
    
    public func numberOfItemsInSection(_ section: Int) -> Int {
        10
    }
    
    // MARK: - Init
    
    init(question: Question) {
        self.question = question
    }
}
