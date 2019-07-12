//
//  NewsListTableCellViewModelProtocol.swift
//  NewsApp
//
//  Created by Pavel Kurilov on 11/07/2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

protocol NewsListTableCellViewModelProtocol: class {
	
	var title: String { get }
	var image: String { get }
	var decription: String { get }
	var date: String { get }
}
