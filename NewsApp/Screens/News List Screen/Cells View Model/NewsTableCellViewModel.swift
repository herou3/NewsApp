//
//  NewsTableCellViewModel.swift
//  NewsApp
//
//  Created by Pavel Kurilov on 12/07/2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

class NewsListTableCellViewModel: NewsListTableCellViewModelProtocol {
	
	// MARK: - Properies
	private var news: News
	
	var title: String {
		return news.title ?? ""
	}
	
	var image: String {
		return news.urlToImage ?? ""
	}
	
	var decription: String {
		return news.descriptionNews ?? ""
	}
	
	var date: String {
		return news.publishedAt ?? ""
	}
	
	// MARK: - Init / deinit
	init(news: News) {
		self.news = news
	}
}
