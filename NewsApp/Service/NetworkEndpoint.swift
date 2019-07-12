//
//  NetworkEndpoint.swift
//  NewsApp
//
//  Created by Pavel Kurilov on 12/07/2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import Foundation

protocol NetworkEndpoint {
	var base: String { get }
	var path: String { get }
}

extension NetworkEndpoint {
	
	// MARK: - Requests
	func requestCharactersByName(_ name: String) -> URLRequest {
		let queryItemName = URLQueryItem(name: "name", value: name)
		var components = URLComponents(string: base)
		components?.path = path
		components?.queryItems = [queryItemName]
		guard let url = components?.url else { return URLRequest(url: URL(string: Constant.baseUrl) ??
			URL(fileURLWithPath: "")) }
		return URLRequest(url: url)
	}
	
	func requestNewsByProperties(_ name: String, date: String,
															 page: String, sortBy: String) -> URLRequest {
		let queryItemName = URLQueryItem(name: "q", value: name)
		let queryItemDate = URLQueryItem(name: "from", value: date)
		let queryItemSortBy = URLQueryItem(name: "sortBy", value: sortBy)
		let queryItemApiKey = URLQueryItem(name: "apiKey", value: Constant.apiKey)
		let queryItemPage = URLQueryItem(name: "page", value: page)
		var components = URLComponents(string: base)
		components?.path = path
		components?.queryItems = [queryItemName,
															queryItemDate,
															queryItemSortBy,
															queryItemApiKey,
															queryItemPage]
		guard let url = components?.url else { return URLRequest(url: URL(string: Constant.baseUrl) ??
			URL(fileURLWithPath: "")) }
		return URLRequest(url: url)
	
	}
	
	func requestCharactersByNameAndByPage(_ name: String,
																				_ page: Int) -> URLRequest {
		let queryItemName = URLQueryItem(name: "name", value: name)
		let queryItemPage = URLQueryItem(name: "page", value: String(page))
		var components = URLComponents(string: base)
		components?.path = path
		components?.queryItems = [queryItemName, queryItemPage]
		guard let url = components?.url else { return URLRequest(url: URL(string: Constant.baseUrl) ??
			URL(fileURLWithPath: "")) }
		return URLRequest(url: url)
	}
	
	func requestCharacterDetail(_ id: String) -> URLRequest {
		let url = URLRequest(url: URL(string: "\(Constant.baseUrl)/api/character/\(id)") ??
			URL(fileURLWithPath: ""))
		return url
	}
}
