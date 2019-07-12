//
//  CarsListViewModelProtocol.swift
//  NewsApp
//
//  Created by Pavel Kurilov on 11/07/2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import Foundation

protocol NewsListViewModelProtocol {
	
	func numberOfRows(inSection section: Int) -> Int
	func numberOfSections() -> Int
	func cellViewModel(forIndexPath indexPath: IndexPath) -> CarsListTableCellViewModelProtocol?
	func selectRow(atIndexPath indexPath: IndexPath)
	func showNewCarViewController()
}
