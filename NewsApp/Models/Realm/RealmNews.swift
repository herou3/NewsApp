//
//  RealmNews.swift
//  NewsApp
//
//  Created by Pavel Kurilov on 11/07/2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import Foundation
import RealmSwift

final class RealmNews: Object, RealmEntity {
	
	// MARK: - Properties
	typealias TransientType = News
	private static let taskPrimaryKey = "publishedAt"
	
	dynamic var source: Source?
	@objc dynamic var author: String?
	@objc dynamic var title: String?
	@objc dynamic var descriptionNews: String?
	@objc dynamic var url: String?
	@objc dynamic var urlToImage: String?
	@objc dynamic var publishedAt: String?
	@objc dynamic var content: String?
	
	// MARK: - Methods
	override class func primaryKey() -> String? {
		return taskPrimaryKey
	}
	
	// MARK: - Realm transform
	static func from(transient: News, in realm: Realm) -> RealmNews {
		
		let cached = realm.object(ofType: RealmNews.self,
															forPrimaryKey: transient.publishedAt)
		let realmNews: RealmNews
		
		if let cached = cached {
			realmNews = cached
		} else {
			realmNews = RealmNews()
			realmNews.publishedAt = transient.publishedAt ?? ""
		}
		
		realmNews.source = transient.source
		realmNews.author = transient.author
		realmNews.descriptionNews = transient.descriptionNews
		realmNews.url = transient.url
		realmNews.urlToImage = transient.urlToImage
		realmNews.publishedAt = transient.publishedAt
		realmNews.content = transient.content
		
		return realmNews
	}
	
	func transient() -> News {
		
		var transient = News(source: Source(name: "", id: ""),
												 author: "",
												 title: "",
												 descriptionNews: "",
												 url: "",
												 urlToImage: "",
												 publishedAt: "",
												 content: "")
		
		transient.source = source
		transient.author = author
		transient.title = title
		transient.descriptionNews = descriptionNews
		transient.url = url
		transient.urlToImage = urlToImage
		transient.publishedAt = publishedAt
		transient.content = content
		
		return transient
	}
}

