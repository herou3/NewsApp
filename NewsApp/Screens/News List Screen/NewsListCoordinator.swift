//
//  NewsListCoordinator.swift
//  NewsApp
//
//  Created by Pavel Kurilov on 12/07/2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

final class NewsListCoordinator {
	
	// MARK: - Properties
	private weak var navigationController: UINavigationController?
	
	// MARK: - Init
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
		let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
		self.navigationController?.navigationBar.barTintColor = .gray
		self.navigationController?.navigationBar.shadowImage = UIImage()
		self.navigationController?.navigationBar.tintColor = .black
		self.navigationController?.navigationBar.titleTextAttributes = textAttributes
	}
	
	func start() {
		showNewsList()
	}
	
	// MARK: - Private implementation
	private func showNewsList() {
		let newsViewModel = NewsListViewModel()
		let controller = NewsListController(viewModel: newsViewModel)
		navigationController?.pushViewController(controller, animated: false)
		controller.navigationItem.title = "News List"
	}
}
