//
//  NetworkRequests.swift
//  NewsApp
//
//  Created by Pavel Kurilov on 12/07/2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import Foundation

class NetworkRequests: NetworkManager {
	
	// MARK: - Properies
	let session: URLSession
	
	// MARK: - Init
	init(configuration: URLSessionConfiguration) {
		self.session = URLSession(configuration: configuration)
	}
	
	convenience init() {
		self.init(configuration: .default)
	}
	
	// MARK: - API requests
	func getFeed(from requestType: RequestFeeds,
							 newsName: String,
							 newsDate: String,
							 newsSortBy: String,
							 page: String,
							 completion: @escaping (Result<NewsList?, NetworkManagerError>) -> Void) {
		let localRequest = requestType.requestNewsByProperties(newsName,
																													 date: newsDate,
																													 page: page,
																													 sortBy: newsSortBy)
		fetch(with: localRequest, decode: { (json) -> NewsList? in
			guard let newsFeedResult = json as? NewsList else { return nil }
			return newsFeedResult
		}, completion: completion)
	
		/*
	func getFeed(from requestType: RequestFeeds,
							 use characterName: String,
							 completion: @escaping (Result<Info?, NetworkManagerError>) -> Void) {
		let localRequest = requestType.requestCharactersByName(characterName)
		fetch(with: localRequest, decode: { json -> Info? in
			guard let weatherFeedResult = json as? Info else { return  nil }
			return weatherFeedResult
		}, completion: completion)
	}
	
	func getFeed(from requestType: RequestFeeds,
							 use characterName: String,
							 use page: Int,
							 completion: @escaping (Result<Info?, NetworkManagerError>) -> Void) {
		let localRequest = requestType.requestCharactersByNameAndByPage(characterName, page)
		fetch(with: localRequest, decode: { json -> Info? in
			guard let weatherFeedResult = json as? Info else { return  nil }
			return weatherFeedResult
		}, completion: completion)
	}
	
	func getFeedCharacter(from requestType: RequestFeeds,
												use id: String,
												completion: @escaping (Result<Character?, NetworkManagerError>) -> Void) {
		let localRequest = requestType.requestCharacterDetail(id)
		fetch(with: localRequest, decode: { json -> Character? in
			guard let weatherFeedResult = json as? Character else { return  nil }
			return weatherFeedResult
		}, completion: completion)
	}
*/
}
}
