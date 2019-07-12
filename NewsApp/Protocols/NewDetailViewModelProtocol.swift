//
//  NewsDetailViewModelProtocol.swift
//  NewsApp
//
//  Created by Pavel Kurilov on 11/07/2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

protocol NewsDetailViewModelProtocol {
	
	// MARK: - Properties
	var url: String { get set }
	
	// MARK: - Dynamic property
	var numberOfRows: Int { get }
	
	// MARK: - Methods
	func saveCar()
	func modelCar() -> String
}
