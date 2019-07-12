//
//  Source.swift
//  NewsApp
//
//  Created by Pavel Kurilov on 11/07/2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import Foundation

struct Source: Codable, TransientEntity {
	
	// MARK: - Properties
	typealias RealmType = RealmSource
	var id: String?
	var name: String?
	
	// MARK: - Coding keys
	enum CodingKeys: String, CodingKey {
		case id
		case name
	}
	
	// MARK: - Init
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		id = try values.decodeIfPresent(String.self, forKey: .id)
	}
	
	init(name: String, id: String) {
		self.name = name
		self.id = id
	}
}
