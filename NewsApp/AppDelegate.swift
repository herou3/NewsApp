//
//  AppDelegate.swift
//  NewsApp
//
//  Created by Pavel Kurilov on 09/07/2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	var coordinator: NewsListCoordinator!

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		self.window = UIWindow(frame: UIScreen.main.bounds)
		self.window?.makeKeyAndVisible()
		self.window?.rootViewController = UINavigationController(nibName: nil, bundle: nil)
		guard let navigationController = window?.rootViewController as? UINavigationController else { return true }
		coordinator = NewsListCoordinator(navigationController: navigationController)
		coordinator.start()
		return true	}
}
