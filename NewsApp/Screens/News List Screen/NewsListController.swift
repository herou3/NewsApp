//
//  NewsListController.swift
//  NewsApp
//
//  Created by Pavel Kurilov on 12/07/2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

class NewsListController: UIViewController {
	
	// MARK: - Properties
	private var viewModel: NewsListViewModelProtocol?
	private let characterCellReuseIdentifier = "cellId"
	private let tableView = UITableView()
	private var searchBar = UISearchBar()
	private var isSearhBarEmpty: Bool {
		return searchBar.text?.isEmpty ?? true
	}

	init(viewModel: NewsListViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
		self.view.backgroundColor = .darkGray
		viewModel.loadNewsData("android", "2019-04-00", "1", "publishedAt")
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
	}
}
