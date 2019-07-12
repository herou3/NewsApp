//
//  NewsListViewModel.swift
//  NewsApp
//
//  Created by Pavel Kurilov on 12/07/2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import Foundation
import RealmSwift

protocol NewsListViewModelDelegate: class {
	// MARK: - Protocols methods
	func newsListViewModel(_ viewModel: NewsListViewModel, didSelectNews news: News)
}

class NewsListViewModel {
	
	// MARK: - Properies
	weak var delegate: NewsListViewModelDelegate?
	private var realm: Realm
	private var realmObjects: Results<RealmNewsList>!
	private var realmWrapper = RealmWrapper()
	private let networRequests: NetworkRequests = NetworkRequests()
	private var newsList: NewsList = NewsList(status: "", totalResults: 12, articles: [], id: "")
	private var curentPage: Int?
	private var selectedIndexPath: IndexPath?
	
	// MARK: - Blocks
	var callAlertBlock: ((_ textTitle: String, _ textMessage: String) -> Void)?
	var requestUpdatedBlock: (() -> Void)?
	var startActivityIndicatorBlock: (() -> Void)?
	var completeActivityIndicatorBlock: (() -> Void)?
	
	// MARK: - Init
	init() {
		
		realm = Realm.persistentStore()
		
		let exampleNewsList = NewsList(status: "Ok",
																	 totalResults: 12,
																	 articles: [News(source: Source(name: "nameSource", id: "idSource"), author: "Pavel", title: "My title", descriptionNews: "Decription", url: "stringUrl", urlToImage: "imageUrl", publishedAt: "curentDate", content: "content")],
																	 id: UUID().uuidString)
		
		if realm.objects(RealmNews.self).isEmpty {
			guard let articles = exampleNewsList.articles else { return }
			for obj in articles {
				realmWrapper.saveObject(object: obj)
			}
		}
		
		for obj in realm.objects(RealmNews.self) {
			self.newsList.articles?.append(obj.transient())
		}
	}
}

// MARK: - Internal Methods
extension NewsListViewModel {
	func loadNewsData(_ name: String, _ date: String,
										_ page: String, _ sortBy: String) {
		
		guard ReachabilityConnect.isConnectedToNetwork() else {
			callAlertBlock?("Oops, you have problem",
											"The Internet connection appears to be offline")
			return
		}
		startActivityIndicatorBlock?()
		networRequests.getFeed(from: .news, newsName: name, newsDate: date, newsSortBy: sortBy, page: page) { (result) in
			self.completeActivityIndicatorBlock?()
			switch result {
			case .success(let info):
				guard let networkInfo = info else { return }
				print(networkInfo)
				self.newsList = networkInfo
				self.requestUpdatedBlock?()
			case .failure(let error):
				self.completeActivityIndicatorBlock?()
				print("This is \(error)")
			}
		}
	}
}

// MARK: - Methods CharactersListViewModelProtocol
extension NewsListViewModel: NewsListViewModelProtocol {
	
	func cellViewModel(forIndexPath indexPath: IndexPath) -> NewsListTableCellViewModelProtocol {
		guard let news = newsList.articles else {
			return NewsListTableCellViewModel(news: News(source: Source(name: "nameOne", id: "sat"),
																									 author: "",
																									 title: "",
																									 descriptionNews: "",
																									 url: "",
																									 urlToImage: "",
																									 publishedAt: "",
																									 content: ""))
		}
		
		return NewsListTableCellViewModel(news: news[indexPath.row])
	}
	
	func numberOfRows(inSection section: Int) -> Int {
		return newsList.articles?.count ?? 0
	}
	
	func numberOfSections() -> Int {
		return 1
	}
	
	func selectRow(atIndexPath indexPath: IndexPath) {
		self.selectedIndexPath = indexPath
		guard let articles = newsList.articles else {
			return
		}
		self.completeActivityIndicatorBlock?()
		delegate?.newsListViewModel(self, didSelectNews: articles[indexPath.row])
	}
}
