//
//  RequestFeeds.swift
//  NewsApp
//
//  Created by Pavel Kurilov on 12/07/2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import Foundation

enum RequestFeeds {
	case news
}

extension RequestFeeds: NetworkEndpoint {
	
	// MARK: - Properties
	var base: String {
		return Constant.baseUrl
	}
	
	var path: String {
		switch self {
			case .news: return "/v2/everything"
		}
	}
	
}
