//
//  Result.swift
//  NewsApp
//
//  Created by Pavel Kurilov on 12/07/2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import Foundation

enum Result<T, U> where U: Error {
	case success(T)
	case failure(U)
}
