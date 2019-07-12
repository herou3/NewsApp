//
//  RealmSource.swift
//  NewsApp
//
//  Created by Pavel Kurilov on 11/07/2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import Foundation
import RealmSwift

final class RealmSource: Object, RealmEntity {
	
	// MARK: - Properties
	typealias TransientType = Source
	private static let taskPrimaryKey = "name"
	
	@objc dynamic var id: String?
	@objc dynamic var name: String?
	
	// MARK: - Methods
	override class func primaryKey() -> String? {
		return taskPrimaryKey
	}
	
	// MARK: - Realm transform
	static func from(transient: Source, in realm: Realm) -> RealmSource {
		
		let cached = realm.object(ofType: RealmSource.self,
															forPrimaryKey: transient.name)
		let realmSource: RealmSource
		
		if let cached = cached {
			realmSource = cached
		} else {
			realmSource = RealmSource()
			realmSource.name = transient.name ?? ""
		}
		
		realmSource.id = transient.id
		
		return realmSource
	}
	
	func transient() -> Source {
		
		var transient = Source(name: "",
													 id: "")
		
		transient.id = id
		transient.name = name
		
		return transient
	}
}
