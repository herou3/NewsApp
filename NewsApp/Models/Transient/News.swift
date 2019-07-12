//
//  Тews.swift
//  NewsApp
//
//  Created by Pavel Kurilov on 11/07/2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import Foundation

struct News: Codable, TransientEntity {
	
	// MARK: - Properties
	typealias RealmType = RealmNews
	
	var source: Source?
	var author: String?
	var title: String?
	var descriptionNews: String?
	var url: String?
	var urlToImage: String?
	var publishedAt: String?
	var content: String?
	
	// MARK: - Coding keys
	enum CodingKeys: String, CodingKey {
		case source
		case author
		case title
		case descriptionNews = "description"
		case url
		case urlToImage
		case publishedAt
		case content
	}
	
	// MARK: - Init
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		source = try values.decodeIfPresent(Source.self, forKey: .source)
		author = try values.decodeIfPresent(String.self, forKey: .author)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		descriptionNews = try values.decodeIfPresent(String.self, forKey: .descriptionNews)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		urlToImage = try values.decodeIfPresent(String.self, forKey: .urlToImage)
		publishedAt = try values.decodeIfPresent(String.self, forKey: .publishedAt)
		content = try values.decodeIfPresent(String.self, forKey: .content)
	}
	
	init(source: Source, author: String,
			 title: String, descriptionNews: String,
			 url: String,
			 urlToImage: String,
			 publishedAt: String,
			 content: String) {
		self.source = source
		self.author = author
		self.title = title
		self.descriptionNews = descriptionNews
		self.url = url
		self.urlToImage = urlToImage
		self.publishedAt = publishedAt
		self.content = content
	}
}
