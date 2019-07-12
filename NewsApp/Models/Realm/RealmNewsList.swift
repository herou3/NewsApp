//
//  RealmNewsList.swift
//  NewsApp
//
//  Created by Pavel Kurilov on 11/07/2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import Foundation
import RealmSwift

final class RealmNewsList: Object, RealmEntity {
	
	// MARK: - Properties
	typealias TransientType = NewsList
	private static let taskPrimaryKey = "status"
	
	@objc dynamic var status: String?
	@objc dynamic var totalResults: String?
	@objc dynamic var id: String = ""
	dynamic var articles: [News]?
	
	// MARK: - Methods
	override class func primaryKey() -> String? {
		return taskPrimaryKey
	}
	
	// MARK: - Realm transform
	static func from(transient: NewsList, in realm: Realm) -> RealmNewsList {
		
		let cached = realm.object(ofType: RealmNewsList.self,
															forPrimaryKey: transient.id)
		let realmNewsList: RealmNewsList
		
		if let cached = cached {
			realmNewsList = cached
		} else {
			realmNewsList = RealmNewsList()
			realmNewsList.id = transient.id ?? ""
		}
		
		realmNewsList.status = transient.status
		realmNewsList.articles = transient.articles
		realmNewsList.totalResults = "\(transient.totalResults ?? 0)"
		return realmNewsList
	}
	
	func transient() -> NewsList {
		
		var transient = NewsList(status: "",
														 totalResults: 0,
														 articles: [News(source: Source(name: "", id: ""),
																						 author: "",
																						 title: "",
																						 descriptionNews: "",
																						 url: "",
																						 urlToImage: "",
																						 publishedAt: "",
																						 content: "")],
														 id: UUID().uuidString)
		
		transient.articles = articles
		transient.status = status
		transient.totalResults = Int(totalResults ?? "")
		transient.id = id
		
		return transient
	}
}
