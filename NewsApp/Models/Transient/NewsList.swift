//
//  NewsList.swift
//  NewsApp
//
//  Created by Pavel Kurilov on 11/07/2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import Foundation

struct NewsList: Codable, TransientEntity {
	
	// MARK: - Properties
	typealias RealmType = RealmNewsList
	
	var id: String
	var status: String?
	var totalResults: Int?
	var articles: [News]?
	
	// MARK: - Coding keys
	enum CodingKeys: String, CodingKey {
		case status
		case totalResults
		case articles
	}
	
	// MARK: - Init
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults)
		articles = try values.decodeIfPresent([News].self, forKey: .articles)
		id = UUID().uuidString
	}
	
	init(status: String, totalResults: Int, articles: [News]?, id: String) {
		self.status = status
		self.totalResults = totalResults
		self.articles = articles
		self.id = id
	}
}
